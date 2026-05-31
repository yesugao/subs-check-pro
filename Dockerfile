# 编译阶段
FROM golang AS builder

WORKDIR /src
COPY go.mod go.sum ./
RUN go mod download

COPY . .
RUN CGO_ENABLED=0 GOEXPERIMENT=jsonv2 go build \
    -trimpath \
    -ldflags="-s -w" \
    -o /app/subs-check-pro .

# 提取时区数据
FROM alpine AS base-files
RUN apk add --no-cache tzdata

# 最终镜像
FROM chainguard/glibc-dynamic:latest-dev

# 覆盖 chainguard 的默认非 root 用户
USER root
WORKDIR /app

# 复制时区
COPY --from=base-files /usr/share/zoneinfo/Asia/Shanghai /usr/share/zoneinfo/Asia/Shanghai
COPY --from=base-files /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

ENV TZ=Asia/Shanghai
ENV RUNNING_IN_DOCKER=true

LABEL org.opencontainers.image.title="subs-check-pro" \
      org.opencontainers.image.description="高性能代理检测筛选工具，支持高并发测活、测速、媒体检测" \
      org.opencontainers.image.url="https://github.com/sinspired/subs-check-pro" \
      org.opencontainers.image.source="https://github.com/sinspired/subs-check-pro" \
      org.opencontainers.image.documentation="https://github.com/sinspired/subs-check-pro/wiki" \
      org.opencontainers.image.vendor="sinspired" \
      org.opencontainers.image.authors="Sinspired https://github.com/sinspired"

# 确保复制的二进制文件具有执行权限
COPY --from=builder --chmod=755 /app/subs-check-pro /app/subs-check-pro

EXPOSE 8199
EXPOSE 8299
CMD ["/app/subs-check-pro"]