# server-tools
################	Setup network on CentOS 7 minimal 	#############
First, type “nmcli d” command in your terminal for quick list ethernet card installed on your machine:

"nmcli d" command output
Type “nmtui” command in your terminal to open Network manager. After opening Network manager chose “Edit connection” and press Enter (Use TAB button for choosing options).

CentOS_7 Network manager screen
Now choose you network interfaces and click “Edit”

Edit your network interfaces
DHCP configuration
Choose “Automatic” in IPv4 CONFIGURATION and check Automatically connect check box and press OK and quit from Network manager.

Set ip adress using DHCP
Reset network services: service network restart

##########################################
