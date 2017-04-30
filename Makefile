.PHONY: default setup init test build run release shell clean

default: test ;

PROJECT_NAME := hello_python
IMAGE_VERSION := 1.0.0
IMAGE_USER := marccarre
IMAGE_NAME := hello-python
IMAGE := $(IMAGE_USER)/$(IMAGE_NAME)
CURRENT_DIR := $(dir $(realpath $(firstword $(MAKEFILE_LIST))))
TESTS_DIR := tests
MIN_CODE_COVERAGE := 90

setup:
	pip install pipenv
	pipenv lock
	pipenv install --dev
	pipenv install

init: setup
	pipenv shell  # Enter virtual environment.

test:
	pylint $(PROJECT_NAME)
	pylint $(TESTS_DIR) --disable=missing-docstring,deprecated-method,invalid-name
	pipenv run pytest --verbose --cov=$(PROJECT_NAME) --cov-report html --cov-fail-under $(MIN_CODE_COVERAGE)

build: test
	docker build \
		-t $(IMAGE):latest \
		-t $(IMAGE):$(IMAGE_VERSION) \
		-t quay.io/$(IMAGE):latest \
		-t quay.io/$(IMAGE):$(IMAGE_VERSION) \
		--build-arg=version=$(IMAGE_VERSION) \
		$(CURRENT_DIR)

run:
	@echo "----------------------------------------"
	docker run $(IMAGE):latest
	@echo "----------------------------------------"

release: build
	docker push $(IMAGE):latest
	docker push $(IMAGE):$(IMAGE_VERSION)
	docker push quay.io/$(IMAGE):latest
	docker push quay.io/$(IMAGE):$(IMAGE_VERSION)

clean:
	rm -fr .cache
	rm -fr .coverage
	rm -fr htmlcov
	-docker rmi -f \
		$(IMAGE):latest \
		$(IMAGE):$(IMAGE_VERSION) \
		quay.io/$(IMAGE):latest \
		quay.io/$(IMAGE):$(IMAGE_VERSION)
