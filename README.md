Python-ready environment with all the Microsoft Azure Cognitive Services modules pre-installed.

 * azure-cognitiveservices-language-spellcheck
 * azure-cognitiveservices-language-textanalytics
 * azure-cognitiveservices-search-customsearch
 * azure-cognitiveservices-search-entitysearch
 * azure-cognitiveservices-search-imagesearch
 * azure-cognitiveservices-search-newssearch
 * azure-cognitiveservices-search-videosearch
 * azure-cognitiveservices-search-websearch
 * azure-cognitiveservices-vision-computervision
 * azure-cognitiveservices-vision-contentmoderator

# Supported tags and respective `Dockerfile` links

- [`3.6-0.1`, `latest`](https://github.com/anashalb/azure-python/blob/master/Dockerfile)

# What are Azure Cognitive Services?

Microsoft Azure Cognitive Services allows you to easily add vision, speech, language and knowledge capabilities to your apps with artificial intelligence APIs.

# How to use this image

## Create a Dockerfile in your Python app project

```console
FROM azure-python:latest

WORKDIR /usr/src/app

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

CMD [ "python", "./your-daemon-or-script.py" ]
```

You can then build and run the Docker image:

```console
$ docker build -t my-python-app .
$ docker run -it --rm --name my-running-app my-python-app
```

## Running a single Python Script

For an expirement, you might find this image sufficient to work with. In such as case, you can start the container from this image in your script's working directory,

```console
$ docker run -it --rm --name some-app -v "$PWD":/usr/src/app anashalb/azure-python python your-daemon-or-script.py
```

OR

```console
$ docker run -it --rm --name some-app -v "$PWD":/usr/src/app anashalb/azure-python
```

where your mounted directory contains a main.py file.

# Image Variants

# `azure-python:latest`

This is the defacto image, running the latest Python version and the latest azure-python release. If you are unsure about what your needs are, you probably want to use this one. It is designed to be used both as a throw away container (mount your source code and start the container to start your app), as well as the base to build other images off of.

# `azure-python:<python-version>-<version>`

The `azure-python` images depend on the running version of Python, as well as the release version of this image. For example, to run the image with Python 3.6 and release 1.0, pull anashalb.azure-python:3.6-1.0do