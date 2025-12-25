#!/bin/bash
cd /opt/minecraft_server
echo "Initializing..."
update_git=1
yes=0
#A time-consuming operation with a loop
while : 
do
    if [ $update_git -eq 1 ];then

	echo "AutoSave $(date +"%A, %b %d, %Y %H:%M:%S"	)"
    	git add --all
    	git commit -m "AutoSave $(date +"%A, %b %d, %Y %H:%M:%S")"
    	git push --force 
    	update_git=0
    	yes=0
    fi 
    sleep 6h  #For each iteration, sleep for  6 hours
done

echo "Done"

