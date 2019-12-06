# Build  BlackArch guide/docs with docker


## Building the docker image


From the root of project, execute: 

`docker build -t blackarchdocs . -f Docker/Dockerfile`

## Running the build

`docker run --name docs -it blackarchdocs make build pdf; docker cp docs:/build/*.pdf /tmp`

Where **/tmp** is destination where the build folder will be copied, end result would be `/tmp/build/`



Notice*

If you look at the Dockerfile, most languages and LateX dependencies are tried to be covered, feel free to install missing one if you are submiting your language.

In the build process, the build is using "make build pdf" instruction covered by Makefile, but it is possible to call gen.sh.
