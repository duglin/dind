all:
	rm -rf bin
	mkdir -p bin/
	cp ${HOME}/docker/bundles/latest/binary-*/* bin/
	rm bin/*md5 bin/*sha256 bin/*-dev
	docker build -t dind -f Dockerfile.alpine .
	docker tag dind ibmdojo/dind
