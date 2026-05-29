# 提取时区数据
FROM alpine AS base-files
RUN apk add --no-cache tzdata

# 最终镜像
FROM chainguard/glibc-dynamic

# 同时接收 TARGETPLATFORM (GoReleaser) 和 TARGETARCH (标准 Buildx)
ARG TARGETPLATFORM
ARG TARGETARCH

WORKDIR /app

# 复制时区
COPY --from=base-files /usr/share/zoneinfo/Asia/Shanghai /usr/share/zoneinfo/Asia/Shanghai
COPY --from=base-files /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

ENV TZ=Asia/Shanghai
ENV RUNNING_IN_DOCKER=true

# 镜像描述标签
LABEL org.opencontainers.image.title="subs-check-pro" \
      org.opencontainers.image.description="高性能代理检测筛选工具，支持高并发测活、测速、媒体检测" \
      org.opencontainers.image.url="https://github.com/sinspired/subs-check-pro" \
      org.opencontainers.image.source="https://github.com/sinspired/subs-check-pro" \
      org.opencontainers.image.documentation="https://github.com/sinspired/subs-check-pro/wiki"

# 1. 如果是 GoReleaser 构建，文件存在于 $TARGETPLATFORM/ 目录下
# 2. 如果是标准 docker buildx 构建，文件通常在 bin/ 目录下
COPY ${TARGETPLATFORM:-bin/subs-check-pro-linux-${TARGETARCH}} /app/subs-check-pro

CMD ["/app/subs-check-pro"]
EXPOSE 8199
EXPOSE 8299