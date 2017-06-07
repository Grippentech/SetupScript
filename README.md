# SetupScript
#### Ubuntu Startup Script designed to install some of the basic tools that I use and setup my desktop environment.

It will help setup a general dev. environment with Z Shell and Sublime Text as well as specific tools for building Jekyll Powered Websites and custom versions of the Linux Kernel.

![terminal](https://cloud.githubusercontent.com/assets/7153954/26794475/cde703d4-49ef-11e7-9c97-eadaf8bda0b2.png)

### The Script Installs:

#### General Packages:

* Git
* Curl (if not availeable by default)
* Wget (if not availeable by default)
* Net Tools
* Sublime Text
* Z Shell (and Oh-My-Zsh, using the Agnoster theme)
* Powerline Fonts
* Python and Pip
* Google Chrome
* Ubuntu Restricted Extras (Media codecs, etc.)
* Unity Tweak Tool
* Gdebi Package Manager (Better, more Light-Weight Alternative to Ubuntu Software Center)
* Guake Terminal (dropdown terminal)

#### For Kernel Development:

* Build-Essential Packages
* Kernel-Package Packages
* Fakeroot
* Libncurses5-dev
* Libssl-dev
* CCache

#### For Ruby and Jekyll Work:

* Ruby-Dev (Required for building Native Gems like Jekyll, Nokogiri etc.)
* Jekyll
* The Bundler Plugin (Which can then be used to install all dependencies via "bundle install" command within the project.)

#### Other Features:

* Removes Amazon Icon (at least temporarily... need to investigate this further)
* Disables Ubuntu Online Search

#### Now featuring a Mac Version! (kinda)

<img width="1094" alt="screen shot 2017-06-07 at 7 37 28 pm" src="https://user-images.githubusercontent.com/7153954/26906088-ead4358c-4bb8-11e7-9d02-ed07d0727164.png">
