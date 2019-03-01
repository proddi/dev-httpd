DOCKERIMAGE="golang:1.12"

.PHONY: build
build:
	./build.sh

.PHONY: clean
clean:
	./clean.sh


#.PHONY: build
docker-build:
	@docker run --rm -v `pwd`:/src ${DOCKERIMAGE} /bin/bash -c "cd /src; make build"

#.PHONY: clean
docker-clean:
	@docker run --rm -v `pwd`:/src ${DOCKERIMAGE} /bin/bash -c "cd /src; make clean"

docker-bash:
	@docker run --rm -it -v `pwd`:/src ${DOCKERIMAGE} /bin/bash -c "cd /src; pwd; ls -la; /bin/bash -i"


help:
	@echo "    build"
	@echo "        Build the server"
	@echo "    clean"
	@echo "        Remove build artifacts"

	@echo "    docker-build"
	@echo "        Build the server (using docker)"
	@echo "    docker-clean"
	@echo "        Remove build artifacts (using docker)"
	@echo "    docker-bash"
	@echo "        Starts a bash within golang environment (using docker)"
