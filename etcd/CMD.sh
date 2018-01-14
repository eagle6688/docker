docker run \
  -it \
  -p 2379:2379 \
  -p 2380:2380 \
  -v /var/data/etcd:/data \
  --name etcd-master \
  eagle6688/etcd \
  --name etcd-master \
  --data-dir /data \
  --listen-client-urls http://0.0.0.0:2379 \
  --initial-advertise-peer-urls http://10.100.97.46:2380 \
  --initial-cluster master=http://10.100.97.46:2380,G510=http://10.100.97.64:2380 \
  --initial-cluster-state new \
  --initial-cluster-token eagle-cluster \
  --advertise-client-urls http://10.100.97.46:2379