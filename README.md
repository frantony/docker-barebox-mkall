# docker-barebox-mkall

barebox MKALL build environment in Docker.

# Usage

```
IMAGE=barebox-debian11
WORKDIR=$(pwd)/workdir

docker build -t $IMAGE -f Dockerfile.debian11 .
mkdir -p $WORKDIR/
cp MKALL-barebox.sh $WORKDIR/
docker run -it -v $WORKDIR:/workdir $IMAGE /workdir/MKALL-barebox.sh | tee $WORKDIR/$IMAGE-$(date +'%Y%m%d%H%M').log
```
