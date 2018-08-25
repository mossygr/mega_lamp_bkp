linux_version=$(lsb_release -r | cut -f2 -d":")
#echo "$linux_version"
#wget https://mega.nz/linux/MEGAsync/xUbuntu_"$linux_version"/amd64/megacmd-xUbuntu_"$linux_version"amd64.deb | sed 's/ //g'

sudo echo https://mega.nz/linux/MEGAsync/xUbuntu_$(lsb_release -r | cut -f2 -d":")/amd64/megacmd-xUbuntu_$(lsb_release -r | cut -f2 -d":")_amd64.deb | sed 's/ //g' > tmp
sudo wget -i tmp
sudo dpkg -i *.deb; sudo dpkg --configure -a; sudo apt-get install -f -y; rm -rf *.deb.*;
mega-cmd

