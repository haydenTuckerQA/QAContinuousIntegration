#!/bin/bash
rm -rf /home/adminht/QACHayden/autoDir1
mkdir autoDir1
touch /home/adminht/QACHayden/autoDir1/autoFile1.txt
touch /home/adminht/QACHayden/autoDir1/autoFile2.txt
sudo mv /home/adminht/QACHayden/autoDir1/autoFile2.txt /home/
sudo mv /home/autoFile2.txt /home/autoFile2.sh
echo 'pwd' > /home/autoFile2.sh
echo 'sudo apt-get install yum' >> /home/autoFile2.sh
sudo chmod +x /home/autoFile2.sh
sudo /home/autoFile2.sh
