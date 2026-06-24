# GearUpMyArchLinux
Automatic ArchLinux setup, update and tool install script to gear up your ArchLinux to be ready for war! 




* This script i made is for making the installation of a new ArchLinux with my own setup for hyprland, kitty conf and so on for a more automatic and easier setup. 
* The script will update and upgrade the system, install the basic and essential tools (atleast those that i use etc)
* This script is easy to use and easy to modify for your own needs etc. 
* Of course you are free to use and modify as you like. 





# How to use
## Run the script locally

1. Download the script
```
git clone https://github.com/suljov/GearUpMyArchLinux
```
2. Move the script
```
mv GearUpMyArchLinux/GearUpMyArchLinux.sh .
```
3. Make it executeable
```
chmod +x GearUpMyArchLinux.sh
```

4. Run the script
```
./GearUpMyArchLinux.sh
```

## Run the script using Curl
```
curl https://raw.githubusercontent.com/suljov/GearUpMyArchLinux/refs/heads/main/GearUpMyArchLinux.sh | bash
```


## Folder permission problem
If error with permissions on the folder "tools", use chown to make your user the owner (this is done in the script but may cause problem) 
```
chown -R <user>:<user> tools
```





You are free to download the script again and use it to upgrade your system further etc. 

