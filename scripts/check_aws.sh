if ! command -v aws &> /dev/null
then
    DISTRO=$( cat /etc/*release | grep -oE -m1 "(Debian|Alpine)" )
    if [ "$DISTRO" = "Debian" ]; then
	   apt install python3-pip \
	   && pip3 install awscli \
	   && aws --version
    elif [ "$DISTRO" = "Ubuntu" ]; then
 	   apt install python3-pip \
	   && pip3 install awscli \
	   && aws --version
    elif [ "$DISTRO" = "Alpine" ]; then
	   apk add --no-cache python3 py3-pip \
	   && pip3 install --upgrade pip \
	   && pip3 install awscli \ 
	   && aws --version
    else
	   exit 1
else
    echo "aws client installed"
fi

