#bin/bash

set -ex

# Fetch the Python version from the Dockerfile VERSION environment variable
VERSION=$(awk '$2 == "VERSION" { print $3; exit }' Dockerfile)

# Fetch the Python version from the Dockerfile PYTHON_VERSION environment variable
PYVERSION=$(awk '$2 == "PYTHON_VERSION" { print $3; exit }' Dockerfile)

IMAGE=azure-python

USERNAME=anashalb

Docker build -t $USERNAME/$IMAGE:$PYVERSION-$VERSION .