from arm64v8/golang

ADD https://github.com/mudler/docker-companion/archive/master.tar.gz /usr/src/

VOLUME ["/user/src/docker-companion"]
RUN cd /user/src/docker-companion
RUN sed 's/BUILD_PLATFORMS ?= -osarch="linux/amd64" -osarch="linux/386" -osarch="linux/arm"/BUILD_PLATFORMS ?= -osarch="linux/amd64" -osarch="linux/386" -osarch="linux/arm64" -osarch="linux/arm"/' Makefile
RUN sed 's/make build BUILD_PLATFORMS="-os=linux -arch=amd64"/make build BUILD_PLATFORMS="-os=linux -arch=arm64"/' Makefile
RUN Make all 






copy ./ 
