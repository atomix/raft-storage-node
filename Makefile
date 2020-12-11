.PHONY: build

VERSION := v0.5.2

DRAGONBOAT_IMPL := dragonboat
DRAGONBOAT_REPO := atomix/dragonboat-raft-storage-node
DRAGONBOAT_VERSION := v0.5.2

ETCD_IMPL := etcd
ETCD_REPO := atomix/etcd-raft-storage-node
ETCD_VERSION := v0.5.2

CONSUL_IMPL := consul
CONSUL_REPO := atomix/consul-raft-storage-node
CONSUL_VERSION := v0.5.2

build: # @HELP build raft-storage-node Docker images
	docker pull ${DRAGONBOAT_REPO}:${DRAGONBOAT_VERSION}
	docker tag ${DRAGONBOAT_REPO}:${DRAGONBOAT_VERSION} atomix/raft-storage-node:${VERSION}
	docker tag ${DRAGONBOAT_REPO}:${DRAGONBOAT_VERSION} atomix/raft-storage-node:${DRAGONBOAT_IMPL}-${DRAGONBOAT_VERSION}
	#docker pull ${ETCD_REPO}:${ETCD_VERSION}
	#docker tag ${ETCD_REPO}:${ETCD_VERSION} atomix/raft-storage-node:${ETCD_IMPL}-${ETCD_VERSION}
	#docker pull ${CONSUL_REPO}:${CONSUL_VERSION}
	#docker tag ${CONSUL_REPO}:${CONSUL_VERSION} atomix/raft-storage-node:${CONSUL_IMPL}-${CONSUL_VERSION}

publish: # @HELP publish raft-storage-node Docker images
publish: build
	docker push atomix/raft-storage-node:${VERSION}
	docker push atomix/raft-storage-node:${DRAGONBOAT_IMPL}-${DRAGONBOAT_VERSION}
	#docker push atomix/raft-storage-node:${ETCD_IMPL}-${ETCD_VERSION}
	#docker push atomix/raft-storage-node:${CONSUL_IMPL}-${CONSUL_VERSION}
