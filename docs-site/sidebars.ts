import type { SidebarsConfig } from '@docusaurus/plugin-content-docs';

// 参考 GitHub Wiki 的 .wiki/_Sidebar.md 生成
const sidebars: SidebarsConfig = {
  mainSidebar: [
    // 顶部入口
    {
      type: 'doc',
      id: 'Home',
      label: '首页',
      className: 'sidebar-icon sidebar-icon-home',
    },
    {
      type: 'doc',
      id: 'Deployment',
      label: '安装与部署',
      className: 'sidebar-icon sidebar-icon-deploy',
    },
    {
      type: 'doc',
      id: 'Cloudflare-Tunnel',
      label: 'CF Tunnel（外网访问）',
      className: 'sidebar-icon sidebar-icon-cf',
    },
    {
      type: 'doc',
      id: 'Speedtest',
      label: '自建测速地址',
      className: 'sidebar-icon sidebar-icon-speed',
    },

    // 功能与使用
    {
      type: 'category',
      label: '✨ 功能与使用',
      items: [
        { type: 'doc', id: 'Subscriptions', label: '📥 订阅使用方法' },
        { type: 'doc', id: 'File-Service', label: '📁 内置文件服务' },
        { type: 'doc', id: 'Notifications', label: '🔔 通知渠道（Apprise）' },
        { type: 'doc', id: 'System-Proxy', label: '🔒 系统与 GitHub 代理' },
        { type: 'doc', id: 'Storage', label: '💾 保存方法' },
      ],
    },

    // 其他
    {
      type: 'category',
      label: '📚 其他',
      items: [
        { type: 'doc', id: 'Features-Details', label: '✨ 新增功能与性能优化' },
        { type: 'doc', id: 'android', label: '📱 安卓手机运行 subs-check 教程' },
        { type: 'link', label: '📖 仓库 README', href: 'https://github.com/sinspired/subs-check-pro' },
      ],
    },

    // 讨论/社区
    {
      type: 'category',
      label: '👥 讨论',
      items: [
        { type: 'link', label: 'Telegram 群组', href: 'https://t.me/sinspired_pro' },
        { type: 'link', label: 'Telegram 频道', href: 'https://t.me/sinspired_ai' },
      ],
    },
  ],
};

export default sidebars;
