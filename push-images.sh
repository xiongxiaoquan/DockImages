#!/bin/bash
#push google or coreos images to dockerhub or aliyun registry

set -e
set -u

for imagepath in $(cat ./imagepath.txt)
do
imagename=$(echo $imagepath | awk -F '/' '{print $NF}')
docker pull $imagepath
#docker tag $imagepath registry.cn-hangzhou.aliyuncs.com/aliwill/$imagename
docker tag $imagepath xiongxq/$imagename
# push到阿里云仓库
#docker push registry.cn-hangzhou.aliyuncs.com/xiongxq/$imagename && \
# push到dockerhub
docker push xiongxq/$imagename
done
