#bin/bash

set -ex

# Fetch the Python version from the Dockerfile VERSION environment variable
VERSION=$(awk '$2 == "VERSION" { print $3; exit }' Dockerfile)

# Fetch the Python version from the Dockerfile PYTHON_VERSION environment variable
PYVERSION=$(awk '$2 == "PYTHON_VERSION" { print $3; exit }' Dockerfile)

IMAGE=azure-python:$PYVERSION-$VERSION

if git diff-index --quiet HEAD --; then
    echo "No changes were made to the repository. Pushing suspended."
else
    
	git add .

	git commit -m "Automated Build Python Version $PYVERSION - Image Version $VERSION"

fi

git pull origin

git tag -a "$PYVERSION-$VERSION" -m "Automated build version $PYVERSION-$VERSION"

git push origin	