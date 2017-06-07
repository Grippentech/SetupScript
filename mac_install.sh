#Fist we get a lot of the basics via Get Mac Apps
curl -s http://www.getmacapps.com/raw/ufjy6uaq5fl | sh

#we need to agree to the XCode licence
sudo xcodebuild -license

#First we install the lovely homebrew package manager
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

#Let's install ZSH
brew install zsh zsh-completions

#Install gnu-sed since the mac fork version is stupid
brew install gnu-sed #Call it as gsed

#Install powerline fonts
# clone
git clone https://github.com/powerline/fonts.git
# install
cd fonts
./install.sh
# clean-up a bit
cd ..
rm -rf fonts

#Let's setup Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

#Set default zsh theme
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
sudo gsed -i '/ZSH_THEME="robbyrussell"/c\ZSH_THEME="powerlevel9k/powerlevel9k" ' ~/.zshrc

