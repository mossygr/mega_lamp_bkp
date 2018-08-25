#!/bin/bash
mega-login &>/dev/null
if [ $? -eq 0 ];then
    linux_version=$(lsb_release -r | cut -f2 -d":")
    #echo "$linux_version"
    #wget https://mega.nz/linux/MEGAsync/xUbuntu_"$linux_version"/amd64/megacmd-xUbuntu_"$linux_version"amd64.deb | sed 's/ //g'

    sudo echo https://mega.nz/linux/MEGAsync/xUbuntu_$(lsb_release -r | cut -f2 -d":")/amd64/megacmd-xUbuntu_$(lsb_release -r | cut -f2 -d":")_amd64.deb | sed 's/ //g' > tmp
    sudo wget -i tmp
    sudo dpkg -i *.deb; sudo dpkg --configure -a; sudo apt-get install -f -y; rm -rf *.deb.*;
    #mega-cmd
    echo "give mega username"
    read username
    echo  -n "give password"
    read -s -p "Password: " PASSWORD
    mega-login $username $PASSWORD
fi
mega-put /home/mossy/Documents/mysqlexporter/website_data /home/mossy/Documents/mysqlexporter/sql_backups /backup