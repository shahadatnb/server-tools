1 install xampp
```
$sudo chmod +x xampp-
$./xampp-
```
2 install net-tools
```
$sudo pacman -S net-tools
```
3 start-stop xampp
```
$sudo /opt/lampp/lampp start
```
or
```
$sudo /opt/lampp/lampp startapache
$sudo /opt/lampp/lampp startmysql
$sudo /opt/lampp/lampp stopapache
$sudo /opt/lampp/lampp stopmysql
```

4 Autostart on boot
4.1 Make file
```
$sudo nano /etc/systemd/system/xampp.service
```

```
########
[Unit]
Description=XAMPP
 [Service]
ExecStart=/opt/lampp/lampp start
ExecStop=/opt/lampp/lampp stop
Type=forking
 [Install]
WantedBy=multi-user.target
##########
```
4.2 Enable . 
```
$systemctl enable xampp
```
