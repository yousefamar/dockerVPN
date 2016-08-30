#!/bin/bash
# require apt-get qrencode

IP=`curl --silent ipecho.net/plain`
PWD=`openssl rand -base64 16`
METHOD=aes-256-cfb
PORT=8388
LOCAL_PORT=1080


# Create Mkdoc source .md file

cat > shadowsocks.md <<EOF
Shadowsocks
-----------

---
* Platforms
    * [Windows](#windows)
    * [OS X](#osx)
    * [Linux](#linux)
    * [Android](#android)
    * [iOS](#ios)

<a name="windows"></a>
### Windows ###
**Method 1:**

1. Download [Shadowsocks for Windows](https://shadowsocks.org/en/download/clients.html).
1. Extract the archive, and double-click on the Shadowsocks.exe file.
1. Make sure the QR code below is centered and completely visible, right-click on the Shadowsocks system tray icon, and go to *Servers* > *Scan QRCode from Screen...*

   ![Shadowsocks QR code](/shadowsocks/shadowsocks-qr-code.png)
   
**Method 2:**

1. You may also go to *Servers* > *New server* and manually complete the following steps:
    * Enter \`$IP\` as the *Server IP*.
    * Enter \`$PORT\` as the *Server Port*.
    * Enter \`$PWD\` as the *Password*.
    * The *Local Port* should be \`$LOCAL_PORT\` and the *Encryption Method* should be \`$METHOD\`.
    * Click *Save*.
1. Click on the Shadowsocks menu tray icon and select *Enable*.
1. That's it! You can verify that your traffic is being routed properly by [looking up your IP address on Google](https://encrypted.google.com/search?hl=en&q=ip%20address). It should say *Your public IP address is $IP*.

<a name="osx"></a>
### OS X ###
**Method 1:**

1. Download [ShadowsocksX](https://shadowsocks.org/en/download/clients.html).
1. Double-click the DMG, and drag the icon into your Applications folder.
1. Launch ShadowsocksX. You will be prompted to enter your password so that your system proxy settings can be modified.
1. Look for the Shadowsocks paper plane icon in your menu bar and click on it.
1. Make sure the QR code below is centered and completely visible, and choose *Scan QR Code from Screen...*

   ![Shadowsocks QR code](/shadowsocks/shadowsocks-qr-code.png)
   
**Method 2:**

1. You may also configure the connection by going to *Servers*, selecting *Open Server Preferences...*, and clicking the *+* button on the sidebar:
    1. Enter \`$IP\` and \`$PORT\` in the *Address* fields.
    1. Make sure \`$METHOD\` is selected for the *Encryption* value.
    1. Enter \`$PWD\` as the *Password*.
    1. Click *OK*.
1. Click on the Shadowsocks icon in the menu bar again, and choose *Global Mode*.
1. You can use the Shadowsocks icon to enable/disable the VPN. The color of the icon will change based on whether or not it is active.
1. That's it! You can verify that your traffic is being routed properly by [looking up your IP address on Google](https://encrypted.google.com/search?hl=en&q=ip%20address). It should say *Your public IP address is $IP*.

<a name="linux"></a>
### Linux ###

1. Download the latest Shadowsocks [linux clients](https://github.com/shadowsocks/shadowsocks-qt5/wiki/Installation#gnulinux) for different Linux distributions.
1. From the command line, run \`ss-qt5\`
1. Click *Connection*, select *Add*, and you can:
    * Make sure the QR code below is centered and completely visible, click on *Scan QR Code on Screnn*

    ![Shadowsocks QR code](/shadowsocks/shadowsocks-qr-code.png)
    
    * Or Choose *Manually*, then fill in the configuration information as follows:

        * Server: \`$IP\`
        * Port: \`$PORT\`
        * Password: \`$PWD\`
        * Encryption Method: \`$METHOD\`

1. Once you have Shadowsocks running locally, you'll need to forward your browser traffic through the SOCKS proxy it provides.

#### Configuring Firefox to connect through a SOCKS proxy ####
1. Click the *Menu* button next to the *Home* icon to the right of the address bar.
1. Click *Options*.
1. Click the *Advanced* icon.
1. Go to the *Network* tab.
1. Click the *Settings* button to *Configure how Firefox connects to the Internet*.
1. Choose *Manual proxy configuration*.
1. Enter \`127.0.0.1\` and Port \`$LOCAL_PORT\` on the *SOCKS Host* line.
1. Select *Remote DNS*. This configures Firefox to send all DNS requests through the SOCKS proxy. This will protect you against DNS poisoning and ensure that false DNS entries cannot be used to censor your access.
1. Click *OK*.
1. Click *OK* again to close the Firefox preferences window.
1. You should be good to go! You can verify that your traffic is being routed properly by [looking up your IP address on Google](https://encrypted.google.com/search?hl=en&q=ip%20address). It should say *Your public IP address is $IP*.


<a name="android"></a>
### Android ###
1. Download Shadowsocks for Android from [Google Play](https://play.google.com/store/apps/details?id=com.github.shadowsocks). If Google Play is blocked in your country, you can download a [latest release apk file](https://github.com/shadowsocks/shadowsocks-android/releases) from Github.
1. Launch the application.
1. Tap the Shadowsocks icon in the top-left of the screen.
1. Tap the *+* icon in the bottom-right.
1. Select *Scan QR code*.
1. Use your phone to scan this image, or if you are using your phone _right now_ you can choose the *Manual Settings* option and copy and paste the information from the Linux section above:

![Shadowsocks QR code](/shadowsocks/shadowsocks-qr-code.png)

1. Tap the plane icon on the top.
1. Accept the Android VPN connection warning.
1. You can verify that your traffic is being routed properly by [looking up your IP address on Google](https://encrypted.google.com/search?hl=en&q=ip%20address). It should say *Your public IP address is $IP*.

<a name="ios"></a>
### iOS ###
Unfortunately, support for Shadowsocks on iOS is terminated, and the app on AppStore is out-of-date. One alternative is:

1. Download a **paid** app [Potatso](https://itunes.apple.com/app/apple-store/id1070901416) and launch it. 
   * You will be prompted to sign into the iTunes Store the first time you run Potatso.
1. Tap the *More* icon in the lower-right of the screen.
1. Tap *Import From QRCode*.
1. Use your phone to scan this image, or if you are using your phone _right now_ you can manually add a new proxy from the *Home* tab and copy and paste the information from the Linux section above:
  
![Shadowsocks QR code](/shadowsocks/shadowsocks-qr-code.png)
     
1. Enter a name when the *Add a new proxy* prompt appears, and tap *OK*. You'll see a confirmation that the import was successful.
1. Tap the *Home* icon.
1. Tap *Proxy* and select the name of the proxy that you just imported.
1. Tap the blue *Connect* button.
    * If this is your first time running Potatso, iOS will ask you to verify that the application should have permission to add VPN configurations. Tap *Allow* and follow the instructions.
1. You can verify that your traffic is being routed properly by [looking up your IP address on Google](https://encrypted.google.com/search?hl=en&q=ip%20address). It should say *Your public IP address is $IP*.
EOF

# Create QRCode
qrencode -o shadowsocks-qr-code.png $(echo -n "ss://"`echo -n $METHOD:$PWD@$IP:8388 | base64`)
# mv shadowsocks-qr-code.png ../nginx/html/shadowsocks/

# Run the container 
docker run  --name shadowsocks -p $PORT:$PORT -d tommylau/shadowsocks -s 0.0.0.0 -p $PORT -k $PWD -m $METHOD
