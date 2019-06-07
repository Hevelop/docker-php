
prepare:
	cd scripts && bash prepare
build:
	cd scripts && bash build
publish: push
push:
	cd scripts && bash push
docker-purge:
	cd scripts && bash docker-purge
clean:
	rm -rf dist