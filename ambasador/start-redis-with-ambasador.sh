#!/bin/bash
docker run --name real-redis -d redis:3
docker run --name redis-ambasador -d -p 6379:6379 --link real-redis:real-redis amouat/ambassador
