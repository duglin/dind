all:
	docker build -t dind -f Dockerfile .
	docker tag dind ibmdojo/dind
