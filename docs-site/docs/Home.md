# Subs-Check⁺ PRO

高性能代理订阅检测器，支持测活、测速、媒体解锁，PC/移动端友好的现代 WebUI，自动生成 Mihomo/Clash 与 sing-box 订阅，集成 sub-store，支持一键分享与无缝自动更新。

![preview](https://sinspired.github.io/subs-check-pro/img/Subs-Check-PRO_OG.png)

## ⚡️ 快速入口

- 🧭 [入门与部署](Deployment)
- 📘 [Cloudflare Tunnel 外网访问](Cloudflare-Tunnel)
- 🚀 [自建测速地址](Speedtest)
- ✨ [新增功能与性能优化](Features-Details)
- 📙 [订阅使用方法](Subscriptions)
- 📕 [内置文件服务](File-Service)
- 📗 [通知渠道（Apprise）](Notifications)
- 🚦 [系统与 GitHub 代理](System-Proxy)
- 💾 [保存方法](Storage)

## 🚀 快速开始

- 二进制运行（Windows）：

```powershell
./subs-check-pro.exe -f ./config/config.yaml
```

- 🐳 Docker（最简）：

```bash
docker run -d \
  --name subs-check-pro \
  -p 8299:8299 \
  -p 8199:8199 \
  -v ./config:/app/config \
  -v ./output:/app/output \
  --restart always \
  ghcr.io/sinspired/subs-check-pro:latest
```

- 配置示例：
  - [查看默认配置](https://github.com/sinspired/subs-check-pro/blob/main/config/config.yaml.example)

## 👥 社区

- Telegram 群组：[加入群组](https://t.me/subs_check_pro)
- Telegram 频道：[关注频道](https://t.me/sinspired_ai)

## 🤝 贡献

欢迎提交 PR 与 Issue。如果要本地开发，请注意仓库使用 Git LFS 管理大文件：

```bash
git lfs install
git clone https://github.com/sinspired/subs-check-pro
cd subs-check-pro
# 如已克隆后再启用 LFS：
git lfs pull
```

更多文档请通过左侧侧边栏或以上入口访问对应页面
