to start server ```sudo java -Xmx2G -jar fabric-server-mc.1.21.11-loader.0.18.3-launcher.1.1.0.jar nogui```

 sudo nano /etc/systemd/system/mc1.service

####——mc1.service——####
[Unit]
Description=Minecraft Server
After=network.target

[Service]
User=sudipta
Group=sudpta

WorkingDirectory=/opt/minecraft_server
ExecStart=/usr/bin/java -Xmx4G -jar fabric-server-mc.1.21.11-loader.0.18.3-launcher.1.1.0.jar nogui
RestartSec=10
Restart=always

[Install]
WantedBy=multi-user.target
####——mc1.service——####


sudo systemctl daemon-reload
service mc1 enable
service mc1 start
service mc1 status

journalctl -fu mc1.service


##server save on git

sudo chmod +x /opt/minecraft_server/save.sh

 sudo nano /etc/systemd/system/mc1_saver.service

####——mc1_saver.service——####
[Unit]
Description=minecraft server save
After=network.target

[Service]
Type=simple
ExecStart=/opt/minecraft_server/save.sh
Restart=always

[Install]
WantedBy=multi-user.target
####——mc1_saver.service——####



sudo systemctl daemon-reload
service mc1_saver enable
service mc1_saver start
service mc1_saver status
