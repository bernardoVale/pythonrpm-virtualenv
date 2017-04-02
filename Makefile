builder:
	docker build -t rpm -f packaging/builder/Dockerfile .

consumer:
	docker build -t centos35 -f packaging/consumer/Dockerfile .

rpm:
	docker run -e QA_SKIP_BUILD_ROOT=1 -v $(shell pwd):/app -w /app -it --rm rpm rpmvenv /app/config.json --verbose

rpm-centos6:
	docker run -e QA_SKIP_BUILD_ROOT=1 -v $(shell pwd):/app -w /app -it --rm rpm:6 rpmvenv /app/config.json --verbose

builder-centos6:
	docker build -t rpm:6 -f packaging/builder-centos6/Dockerfile .