#!/bin/sh

#############################
#    General Preferences    #
#############################

#Create an admin user with a better name than 'user'
#adduser patrick
#adduser patrick sudo

#Create script for rebooting into ChromeOS
####echo '#!/bin/sh' > ~/Desktop/rebootToChromeOS.sh
####echo 'sudo cgpt add -i 6 -P 0 -S 1 /dev/sda' >> ~/Desktop/rebootToChromeOS.sh
####echo 'sudo reboot' >> ~/Desktop/rebootToChromeOS.sh
####chmod 755 ~/Desktop/rebootToChromeOS.sh

#############################
#    Chrubuntu bug fixes    #
#############################

#Fix CPU spike after closing lid to suspend. see http://www.cidgendered.com/?p=9
stop acpid
echo 'manual' > /etc/init/acpid.override

#Install xdotool for enabling shortcut buttons
#apt-get install xdotool
#echo 'xdotool installed, you can now create shortcut buttons'

#Fix trackpad


##############################
#        Development         #
##############################

#Add 'web' user?

#Install Apache2

#Install mysql

#Install PHP

#Install git
#####apt-get install git-core

#Install SublimeText
####add-apt-repository ppa:webupd8team/sublime-text-2
####apt-get update
####apt-get install sublime-text

