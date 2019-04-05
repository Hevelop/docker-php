
prepare:
	cd scripts && bash prepare
build:
	cd scripts && bash build
publish: build push
push:
	cd scripts && bash push
clean:
	rm -rf dist