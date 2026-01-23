# 安装与部署

> 首次运行会在当前目录生成默认配置文件。

## 二进制文件运行

下载 Releases 中适合的版本，解压后直接运行即可。

```powershell
./subs-check.exe -f ./config/config.yaml
```

## 源码运行

欢迎提交 PR

```bash
git lfs install
git clone https://github.com/sinspired/subs-check-pro
cd subs-check-pro
go run . -f ./config/config.yaml
```

## Docker 运行

> 注意：
>
> - 限制内存请使用 `--memory="500m"`。
> - 可通过环境变量 `API_KEY` 设置 Web 控制面板的 API Key。

```bash
# 基础运行
docker run -d \
  --name subs-check \
  -p 8299:8299 \
  -p 8199:8199 \
  -v ./config:/app/config \
  -v ./output:/app/output \
  --restart always \
  ghcr.io/sinspired/subs-check:latest

# 使用代理运行
docker run -d \
  --name subs-check \
  -p 8299:8299 \
  -p 8199:8199 \
  -e HTTP_PROXY=http://192.168.1.1:7890 \
  -e HTTPS_PROXY=http://192.168.1.1:7890 \
  -v ./config:/app/config \
  -v ./output:/app/output \
  --restart always \
  ghcr.io/sinspired/subs-check:latest
```

## Docker Compose

```yaml
version: "3"
services:
  subs-check:
    image: ghcr.io/sinspired/subs-check:latest
    container_name: subs-check
    volumes:
      - ./config:/app/config
      - ./output:/app/output
    ports:
      - "8299:8299"
      - "8199:8199"
    environment:
      - TZ=Asia/Shanghai
      # - HTTP_PROXY=http://192.168.1.1:7890
      # - HTTPS_PROXY=http://192.168.1.1:7890
      # - API_KEY=subs-check
    restart: always
    network_mode: bridge
```

## 使用 WatchTower 自动更新并通知

### 基础命令，每小时检查更新

```bash
docker run -d \
  --name watchtower \
  -e WATCHTOWER_POLL_INTERVAL=3600 \
  -v /var/run/docker.sock:/var/run/docker.sock \
  containrrr/watchtower subs-check
```

### 配置 shoutrrr 格式的 Telegram 通知

```bash
docker run -d \
  --name watchtower \
  -e WATCHTOWER_NOTIFICATIONS=shoutrrr \
  -e WATCHTOWER_NOTIFICATION_URL=telegram://<bot_token>@telegram?channels=<chat_id> \
  -v /var/run/docker.sock:/var/run/docker.sock \
  containrrr/watchtower subs-check
```

### 通过 webhook 使用 apprise 通知

```bash
docker run -d \
  --name watchtower \
  --restart always \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -e WATCHTOWER_POLL_INTERVAL=3600 \
  -e WATCHTOWER_NOTIFICATIONS=shoutrrr \
  -e WATCHTOWER_NOTIFICATION_URL="webhook://<server-ip>:8000/notify?urls=telegram://<bot_token>@telegram?chat_id=<chat_id>,mailto://user:pass@smtp.example.com/?from=watchtower@example.com&to=you@example.com" \
  containrrr/watchtower subs-check
```

## 安卓手机运行subs-check教程

参考教程 [安卓手机运行subs-check教程](android)
