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

#Now let's get Jekyll and Bundler installed properly.
#For now we assume Ruby 2.1.0 or higher is already installed, if this assumption proves wrong, this may need to change
sudo apt-get install ruby-dev -y
sudo gem install bundler
sudo gem install jekyll
#Well not it's a matter of running "bundle install" on tour website to install all other gem dependencies

#Now let's get media codecs and othe features via Ubuntu Restricted Extras
sudo apt-get install ubuntu-restricted-extras -y

#Now a lightweight deb pkg manager aka gdebi, since it's better at handling dependencies and more lightweight than the default ubuntu one
sudo apt-get install gdebi -y

#Now let's remove the stupid Amazon integration, although this package gets reinstalled by unity-tweak-tool, seems to keep Amazon off the device
sudo apt-get remove unity-webapps-common -y

#Unity Tweak Tool, I'm not using stock Unity without it
sudo apt-get install unity-tweak-tool -y

#Now stop Ubuntu from searching online, making it more responsive and privacy conscious
/bin/bash -c "gsettings set com.canonical.Unity.Lenses remote-content-search 'none'"
#Now that I'm fairly sure it's fine that it's running under bash and not ZSH here. 