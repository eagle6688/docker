sudo mkdir /data/zookeeper
docker run -dit --name zookeeper -v /data/zookeeper:/data -p 2181:2181 --restart always zookeeper

sudo firewall-cmd --zone=public --add-port=2181/tcp --permanent
sudo firewall-cmd --reload
sudo firewall-cmd --list-ports