#bin/bash

set -ex

# Fetch the Python version from the Dockerfile VERSION environment variable
VERSION=$(grep -E '^ENV VERSION' Dockerfile | grep -o -E '[0-9]+(\.[0-9]+)*')

# Fetch the Python version from the Dockerfile PYTHON_VERSION environment variable
PYVERSION=$(grep -E '^ENV PYTHON_VERSION' Dockerfile | grep -o -E '[0-9]+(\.[0-9]+)*')

IMAGE=azure-python:$PYVERSION-$VERSION

git add .

git commit -m "Automated Build Python Version $PYVERSION - Image Version $VERSION"

git pull origin

git tag -a "$PYVERSION-$VERSION" -m "Automated build version $PYVERSION-$VERSION"

git push origin