SHELL = /bin/sh
.PHONY: all build clean deps html install lint pdf

# We only care about tex files at the moment so clear and explictly denote that
.SUFFIXES:
.SUFFIXES: .tex

# Set the src directory. You can overwrite this by setting your build command
# to `make srcdir=path <target>`
ifndef srcdir
srcdir = latex
endif

default: all

all: lint build sync

# build everything supported
build: pdf html

# delete all files used for building
# this is a hack, the build should be done in a tmp directory and the pdf/html
# files moved to a more permanent location
clean:
	@rm *.aux *.log *.out *.toc ./build_log

# update all deps to the latest versions available
deps:
	@tput setaf 3; @echo "Currently this works on Ubuntu only"
	@tput setaf 10
	sudo apt-get update
	sudo apt-get install make
	sudo apt-get install -y texlive
	sudo apt-get install -y latex2html
	sudo apt-get install -y texlive-latex-extra

# make html files
html:
	@tput setaf 3; echo "this needs to be implemented"
	@tput setaf 10

# sync the files to the remote server
install:

# run the latex linting tool
lint:
	@tput setaf 3; echo "this needs to be implemented"
	@tput setaf 10

# generate a pdf using lualatex
pdf:
	@lualatex ${srcdir}/blackarch-guide-en.tex 1>./build_log
	@lualatex ${srcdir}/blackarch-guide-en.tex 1>./build_log
