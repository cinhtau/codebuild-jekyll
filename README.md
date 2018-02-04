![Build](https://travis-ci.org/cinhtau/codebuild-jekyll.svg?branch=master)

This is a customized Docker container for AWS Code Build.

You can find the official images of AWS in https://github.com/aws/aws-codebuild-docker-images.

## Customization

AWS CodeBuild building time matters.

Using gulp to automate all tasks with Jekyll, which needs ruby. Gulp itself is based on nodejs. To make it complete,
AWS CLI needs python. So it the end the `buildspec.yml` in CodeBuild either has a pretty big install section, or I just
use this container with all required languages, packages.
 
This docker image installs all mandatory npm packages and ruby gem packages for my respective jekyll build.
The AWS CLI is included.

## Base Image

I choose to use the official Ruby image based on Debian Stretch.

- Ruby v2.5.0
- Node.js is v8.
- Python v2.7

## Docker 

This section describes the Docker build and deployment options.

### Manual build

```bash
docker build -t cinhtau/codebuild-jekyll .
```

### Deployment

To push the image to dockerhub manually login with respective credentials. Just an example below (not real data) :smile: !

```bash
docker login -p="I_am_Legend" -u="cinhtau"
```

Push to dockerhub

```bash
docker push cinhtau/codebuild-jekyll
```