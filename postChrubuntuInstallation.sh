#!/bin/sh




#############################
#    General Preferences    #
#############################

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
echo 'sudo reboot' >> ~/Desktop/rebootToChromeOS.sh
chmod 755 ~/Desktop/rebootToChromeOS.sh




##############################
#        Development         #
##############################

#Install Apache2, mysql and PHP
sudo apt-get install lamp-server^
sudo apt-get install phpmyadmin
sudo service apache2 restart

#Install git
sudo apt-get install git-core
git config --global core.editor "vi"

#Install SublimeText
sudo add-apt-repository ppa:webupd8team/sublime-text-2
sudo apt-get update
sudo apt-get install sublime-text




#############################
#    Chrubuntu bug fixes    #
#############################

#Install xdotool for enabling shortcut buttons
sudo apt-get install xdotool
echo 'xdotool installed, you can now fix the shortcut buttons. follow instructions from here: http://www.reddit.com/r/chrubuntu/comments/1crefd/how_to_get_shortcut_keys_to_work_on_chrubuntu/'

#Fix trackpad
sudo sed -i '/# http:\/\/who-t.blogspot.com\/2010\/11\/how-to-ignore-configuration-errors.html/a#The next 2 lines were added by the postChrubuntuInstallation script:\nOption "FingerLow" "4"\nOption "FingerHigh" "10"' /usr/share/X11/xorg.conf.d/50-synaptics.conf

#Virtualbox not working?
wget http://www.cisgendered.com/~keyvin/virtualbox-kernel-mods-3.4.0.deb
sudo dpkg -i virtualbox-kernel-mods-3.4.0.deb

#Fix CPU spike after closing lid to suspend. see http://www.cidgendered.com/?p=9
echo "STATUS: Fixing CPU spike after closing lid to suspend."
sudo stop acpid
sudo bash
echo 'manual' > /etc/init/acpid.override
exit

#backups of the deb files are here: https://dl.dropboxusercontent.com/u/3686035/chrubuntu_fixes/
#Alternate CPU spike on lid close fix
####wget http://www.cisgendered.com/~keyvin/acpid_2.0.10-1_amd64.deb
####sudo dpkg -i acpid_2.0.10-1_amd64.deb

#Internal mic not working?
####wget http://www.cisgendered.com/~keyvin/mic-fix.deb
####sudo dpkg -i mic-fix.deb
####sudo shutdown -r now

echo "All done. You should reboot for all changes to take effect."
