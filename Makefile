.PHONY: image push-image

###### Help ###################################################################

help:
	@echo '    image ............................... builds a docker image'
	@echo '    push-image .......................... pushes image to docker-hub'

###### Docker #################################################################

image:
	docker build -t cfgarden/grootfs-bench-release-ci ci/grootfs-bench-release-ci

push-image:
	docker push cfgarden/grootfs-bench-release-ci
