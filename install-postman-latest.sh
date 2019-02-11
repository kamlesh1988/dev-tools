wget https://dl.pstmn.io/download/latest/linux64 -O /tmp/postman.tar.gz
sudo tar -xzf /tmp/postman.tar.gz -C /opt
rm /tmp/postman.tar.gz
sudo rm /usr/bin/postman
sudo ln -s /opt/Postman/Postman /usr/bin/postman

echo '[Desktop Entry]
Name=Postman
Type=Application
Exec=/opt/Postman/Postman
Terminal=false
Icon=/opt/Postman/app/resources/app/assets/icon.png
Comment=Postman
NoDisplay=false
Categories=Development;IDE;
Name[en]=Postman' > /home/$USER/.local/share/applications/postman.desktop
