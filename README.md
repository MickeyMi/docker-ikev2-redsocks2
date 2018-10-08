# IKEv2 VPN Server on Docker

Recipe to build [`gaomd/ikev2-vpn-server`](https://registry.hub.docker.com/u/gaomd/ikev2-vpn-server/) Docker image.

## Usage

### 1. 启动ikev2 And redsocks2

    docker run -d --name ikev2-redsocks2 --privileged=true -p 500:500/udp -p 4500:4500/udp -e "SSIP=你的宿主机SS地址" -e "SSPORT=SS端口" ikev2-redsocks2:latest

### 2. 创建客户端配置文件 .mobileconfig (for iOS / macOS)

    docker run --privileged -i -t --rm --volumes-from ikev2-redsocks2 -e "HOST=ikev2服务器地址" ikev2-redsocks2:latest generate-mobileconfig > ikev2-vpn.mobileconfig

*务必将`ikev2服务器地址`替换为您自己的域名，并将其解析为您服务器的IP地址。 简单地说，也支持IP地址（并享受更快的握手速度）。*

通过SSH隧道（`scp`）或任何其他安全方法将生成的`ikev2-vpn.mobileconfig`文件传输到本地计算机。

## Technical Details

Upon container creation, a *shared secret* was generated for authentication purpose, no *certificate*, *username*, or *password* was ever used, simple life!

## License

Copyright (c) 2016 Mengdi Gao, This software is licensed under the [MIT License](LICENSE).

---

\* IKEv2协议需要iOS 8或更高版本，macOS 10.11 El Capitan或更高版本。

\* 安装** iOS 8或更高版本**或当您的AirDrop失败时：使用`.mobileconfig`文件作为附件向您的iOS设备发送电子邮件，然后点击附件以启动并完成**安装 个人资料**屏幕。
