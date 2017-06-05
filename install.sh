#First Let's Update and Upgrade Everything
sudo apt-get update 
sudo apt-get upgrade -y
sudo apt-get dist-upgrade -y

#Now let's install git
sudo apt-get install git curl wget -y

#Now let's install Net-Tools, mainly for ifconfig command, which gets installed in /sbin/ifconfig (if VmWare tools or anything asks)
sudo apt-get install net-tools -y

#Now let's install Sublime Text
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt-get update #Update since now we have the new package
sudo apt-get install sublime-text -y

#First we install ZSH and make it default
sudo apt-get install zsh -y
#chsh -s $(which zsh) #Make ZSH the default shell, appears broken rn
sudo echo 'exec zsh' | cat - ~/.bashrc > temp && mv temp ~/.bashrc #Start Zsh when bash executes

#Now let's get Oh My Zsh Installed
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

#TODO - GET ZSH PLUGINS AT SOME POINT.....

#Now set the ZSH Theme
sudo sed -i '/ZSH_THEME="robbyrussell"/c\ZSH_THEME="agnoster" # (this is one of the fancy ones).' ~/.zshrc

#Now install Powerline fonts for the theme
sudo apt-get install python-pip -y
su -c 'pip install git+git://github.com/Lokaltog/powerline'

wget https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf
sudo mv PowerlineSymbols.otf /usr/share/fonts/
sudo fc-cache -vf
sudo mv 10-powerline-symbols.conf /etc/fonts/conf.d/

sudo echo 'if [[ -r /usr/local/lib/python2.7/dist-packages/powerline/bindings/zsh/powerline.zsh ]]; then
    source /usr/local/lib/python2.7/dist-packages/powerline/bindings/zsh/powerline.zsh
fi' | cat - ~/.bashrc > temp && mv temp ~/.bashrc #Start Zsh when bash executes

#Now let's get Chrome via google's external repository
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - 
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list' #This needs to be here since 32 bit no longer exists, only 64 bit, stops APT from complaining
sudo apt-get update
sudo apt-get install google-chrome-stable

#Now let's get some kernel tools downloaded, this is about 1.6GB+ so only install it if you need it 
sudo apt-get install build-essential kernel-package fakeroot libncurses5-dev libssl-dev ccache -y

