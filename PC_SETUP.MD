## Setup Instructions
1. clone repo
2. run setup.sh from home directory
3. setup git
	- run following commands
	```
	ssh-keygen -t ed25519 -C "myemail@address.com"
	ssh-add ~/.ssh/id_ed25519
	xclip -sel clip < ~/.ssh/id_ed25519.pub
	```
	- Go to version control site and paste in new ssh key
4. Sign into chrome gnome shell extensions and install extensions
5. 