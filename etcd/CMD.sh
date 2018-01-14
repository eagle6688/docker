sudo firewall-cmd --zone=public --add-port=2379/tcp --permanent
sudo firewall-cmd --zone=public --add-port=2380/tcp --permanent
sudo firewall-cmd --reload
sudo firewall-cmd --list-ports

docker run \
  -it \
  -p 2379:2379 \
  -p 2380:2380 \
  -v /var/data/etcd:/data \
  --name etcd-master \
  eagle6688/etcd \
  --name etcd-master \
  --data-dir /data \
  --listen-peer-urls http://0.0.0.0:2380 \
  --listen-client-urls http://0.0.0.0:2379 \
  --initial-advertise-peer-urls http://10.100.97.46:2380 \
  --initial-cluster etcd-master=http://10.100.97.46:2380 \
  --initial-cluster-state new \
  --initial-cluster-token eagle-cluster \
  --advertise-client-urls http://10.100.97.46:2379

curl http://10.100.97.46:2379/v2/members -XPOST -H "Content-Type: application/json" -d '{"peerURLs":["http://10.100.97.64:2380"]}'

docker run \
  -it \
  -p 2379:2379 \
  -p 2380:2380 \
  -v /var/data/etcd:/data \
  --name etcd-G510 \
  eagle6688/etcd \
  --name etcd-G510 \
  --data-dir /data \
  --listen-peer-urls http://0.0.0.0:2380 \
  --listen-client-urls http://0.0.0.0:2379 \
  --initial-advertise-peer-urls http://10.100.97.64:2380 \
  --initial-cluster etcd-master=http://10.100.97.46:2380,etcd-G510=http://10.100.97.64:2380 \
  --initial-cluster-state existing \
  --initial-cluster-token eagle-cluster \
  --advertise-client-urls http://10.100.97.64:2379