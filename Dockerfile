FROM python:3-alpine
ARG version
LABEL version ${version}
LABEL description "Hello, Python!"
LABEL maintainer "Marc Carre <carre.marc@gmail.com>"

COPY . /usr/src/hello_python

WORKDIR /usr/src/hello_python
RUN pip install --no-cache-dir pipenv
RUN pipenv lock && pipenv install

ENTRYPOINT ["python", "/usr/src/hello_python/hello_python/sample_module.py"]
