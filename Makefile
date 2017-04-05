builder:
	docker build -t rpm -f packaging/builder/Dockerfile .

builder-centos6:
	docker build -t rpm:6 -f packaging/builder-centos6/Dockerfile .

builder-wsgc:
	docker build -t rpm:wsgc -f packaging/builder-wsgc/Dockerfile .

consumer:
	docker build -t centos35 -f packaging/consumer/Dockerfile .

consumer-wsgc:
	docker build -t centos35:wsgc -f packaging/consumer-wsgc/Dockerfile .

consumer-centos6:
	docker build -t centos35:6 -f packaging/consumer/Dockerfile .

rpm-wsgc:
	docker run -e QA_SKIP_BUILD_ROOT=1 -v $(shell pwd):/data -w /data -it --rm rpm:wsgc rpmvenv /data/wsgc.json --verbose

rpm:
	docker run -e QA_SKIP_BUILD_ROOT=1 -v $(shell pwd):/app -w /app -it --rm rpm rpmvenv /app/centos7.json --verbose

rpm-centos6:
	docker run -e QA_SKIP_BUILD_ROOT=1 -v $(shell pwd):/app -w /app -it --rm rpm:6 rpmvenv /app/centos6.json --verbose

test:
	docker run -e QA_SKIP_BUILD_ROOT=1 -v $(shell pwd):/app -w /app -it --rm rpm rpmvenv /app/centos7.json --verbose --spec