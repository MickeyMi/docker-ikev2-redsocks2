## 用法

### 1. 启动ikev2 And redsocks2

    docker run -d --name ikev2-redsocks2 --privileged -p 500:500/udp -p 4500:4500/udp -e "SSIP=你SSIP" -e "SSPORT=你SS端口" mickeymi/ikev2-redsocks2:latest

### 2. 创建客户端配置文件 .mobileconfig (for iOS / macOS)

    docker run --privileged -it --rm --volumes-from ikev2-redsocks2 -e "HOST=你的服务器地址" mickeymi/ikev2-redsocks2:latest generate-mobileconfig > ikev2-vpn.mobileconfig

*务必将`ikev2服务器地址`替换为您自己的域名，并将其解析为您服务器的IP地址。 简单地说，也支持IP地址（并享受更快的握手速度）。*

### 3.安装.mobileconfig（适用于iOS / macOS）

下载ikev2-vpn.mobileconfig到本地

iOS 9或更高版本：将.mobileconfig文件AirDrop到iOS 9设备，完成安装配置文件屏幕;

macOS 10.11 El Capitan或更高版本：双击.mobileconfig文件以启动配置文件安装向导。

## License

Copyright (c) 2019 Mickey Zhang And MickeyMi, This software is licensed under the [MIT License](LICENSE).

---

\* IKEv2协议需要iOS 8或更高版本，macOS 10.11 El Capitan或更高版本。

\* 安装** iOS 8或更高版本**或当您的AirDrop失败时：使用`.mobileconfig`文件作为附件向您的iOS设备发送电子邮件，然后点击附件以启动并完成**安装 个人资料**屏幕。
