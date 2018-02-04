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

## Docker build

Manual build

```bash
docker build -t cinhtau/codebuild-jekyll .
```

