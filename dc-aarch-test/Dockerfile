FROM arm64v8/golang

ADD https://github.com/mudler/docker-companion/archive/master.tar.gz /usr/src/

VOLUME ["/user/src/docker-companion"]
RUN cd /user/src/docker-companion
## fix make file to hopefully build for amr64 arm7 can work on aarch64 kernels with +32 bit support. 
## however less than iadel. 
## eats built docker to tarball 
## however quick test build  can hopefully use in further gentoo-arm64 containers. latter. 
RUN sed 's/BUILD_PLATFORMS ?= -osarch="linux/amd64" -osarch="linux/386" -osarch="linux/arm"/BUILD_PLATFORMS ?= -osarch="linux/amd64" -osarch="linux/386" -osarch="linux/arm64" -osarch="linux/arm"/' Makefile
RUN sed 's/make build BUILD_PLATFORMS="-os=linux -arch=amd64"/make build BUILD_PLATFORMS="-os=linux -arch=arm64"/' Makefile
RUN Make all 
