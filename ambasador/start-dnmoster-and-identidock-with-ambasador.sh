#!/bin/bash
docker run --name dnmonster -d amouat/dnmonster:1.0
docker run --name redis-ambasador -d \
	-e REDIS_PORT_6379_TCP=tcp://$(docker-machine ip redis-host):6379 amouat/ambassador

docker run --name real-identidock -d -p 80:9090 \
	--link dnmonster:dnmonster --link redis-ambasador:redis amouat/identidock:1.0
