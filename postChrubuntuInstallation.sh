#!/bin/sh

#############################
#    General Preferences    #
#############################
echo ""
echo ""

#Create an admin user with a better name than 'user'
echo "STATUS: Creating a new administrator user."
while true; do
    read -p "Do you wish to create a new administrator user?  [Y/n]" yn
    case $yn in
        [Yy]* )  
		echo "What is the user's name?";
		read input_variable;
		sudo adduser $input_variable;
		sudo adduser $input_variable sudo;
		break;;
        [Nn]* ) break;;
        * ) echo "Please answer yes or no.";;
    esac
done

#Create script for rebooting into ChromeOS
echo "STATUS: Creating a script to boot into ChromeOS."
echo '#!/bin/sh' > ~/Desktop/rebootToChromeOS.sh
echo 'sudo cgpt add -i 6 -P 0 -S 1 /dev/sda' >> ~/Desktop/rebootToChromeOS.sh
echo 'reboot' >> ~/Desktop/rebootToChromeOS.sh
chmod 755 ~/Desktop/rebootToChromeOS.sh

#############################
#    Chrubuntu bug fixes    #
#############################

#Fix CPU spike after closing lid to suspend. see http://www.cidgendered.com/?p=9
echo "STATUS: Fixing CPU spike after closing lid to suspend."
#stop acpid
#echo 'manual' > /etc/init/acpid.override

#Install xdotool for enabling shortcut buttons
#apt-get install xdotool
#echo 'xdotool installed, you can now create shortcut buttons'

#Fix trackpad
sudo cp /usr/share/X11/xorg.conf.d/50-synaptics.conf /etc/X11/xorg.conf.d
sudo sed -i '/# http:\/\/who-t.blogspot.com\/2010\/11\/how-to-ignore-configuration-errors.html/a#The next 2 lines were added by the postChrubuntuInstallation script:\nOption "FingerLow" "4"\nOption "FingerHigh" "10"' /etc/X11/xorg.conf.d

##############################
#        Development         #
##############################

#Add 'web' user?

#Install Apache2
####apt-get install apache2

#Install mysql
####apt-get install mysql-server mysql-client

#Install PHP
####apt-get install php5 libapache2-mod-php5 php5-mysql
####service apache2 restart

#Install git
#####apt-get install git-core
#####git config --global core.editor "vi"

#Install SublimeText
####add-apt-repository ppa:webupd8team/sublime-text-2
####apt-get update
####apt-get install sublime-text

echo "All done. You should reboot for all changes to take effect."
