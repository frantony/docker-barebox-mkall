# docker-barebox-mkall

barebox MKALL build environment in Docker.

# Usage

```
IMAGE=barebox-debian10

docker build -t $IMAGE -f Dockerfile.debian10 .
docker run -it $IMAGE MKALL-barebox.sh 2>&1 | tee $IMAGE-$(date +'%Y%m%d%H%M').log
```
