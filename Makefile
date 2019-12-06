SHELL = /bin/sh
.PHONY: all build clean deps html install lint 
VERSION?=1.1

# We only care about tex files at the moment so clear and explictly denote that
.SUFFIXES:
.SUFFIXES: .tex

# Set the src directory. You can overwrite this by setting your build command
# to `make srcdir=path <target>`
ifndef srcdir
srcdir = latex
endif

default: all

all: lint build

.PHONY: docker-build
docker-build:
	docker build -t ba-guide:$(VERSION) Docker


# build everything supported
build: pdf html

# delete all files used for building
# this is a hack, the build should be done in a tmp directory and the pdf/html
# files moved to a more permanent location
clean:
	@rm *.aux *.log *.out *.toc ./build_log*

# update all deps to the latest versions available
deps:
	@tput setaf 3; echo "Currently this works on Ubuntu only"
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

# generate pdf per language
.PHONY: pdf-de
pdf-de:
	@echo "Compiling German guide - output in build_log_de"
	@docker run \
		--rm \
		-ti \
		-v $(shell pwd):/guide:rw \
		-w /guide \
		--hostname ba-guide \
		ba-guide:$(VERSION) \
		/bin/sh -c "lualatex \
			    ${srcdir}/blackarch-guide-de.tex 1>./build_log_de; \
			    lualatex \
			    ${srcdir}/blackarch-guide-de.tex 1>>./build_log_de"

.PHONY: pdf-el
pdf-el:
	@echo "Compiling Greek guide - output in build_log_el"
	@docker run \
		--rm \
		-ti \
		-v $(shell pwd):/guide:rw \
		-w /guide \
		--hostname ba-guide \
		ba-guide:$(VERSION) \
		/bin/sh -c "lualatex \
			    ${srcdir}/blackarch-guide-el.tex 1>./build_log_el; \
			    lualatex \
			    ${srcdir}/blackarch-guide-el.tex 1>>./build_log_el"

.PHONY: pdf-en
pdf-en:
	@echo "Compiling English guide - output in build_log_en"
	@docker run \
		--rm \
		-ti \
		-v $(shell pwd):/guide:rw \
		-w /guide \
		--hostname ba-guide \
		ba-guide:$(VERSION) \
		/bin/sh -c "lualatex \
			    ${srcdir}/blackarch-guide-en.tex 1>./build_log_en; \
			    lualatex \
			    ${srcdir}/blackarch-guide-en.tex 1>>./build_log_en"

.PHONY: pdf-es
pdf-es:
	@echo "Compiling Spanish guide - output in build_log_es"
	@docker run \
		--rm \
		-ti \
		-v $(shell pwd):/guide:rw \
		-w /guide \
		--hostname ba-guide \
		ba-guide:$(VERSION) \
		/bin/sh -c "lualatex \
			    ${srcdir}/blackarch-guide-es.tex 1>./build_log_es; \
			    lualatex \
			    ${srcdir}/blackarch-guide-es.tex 1>>./build_log_es"

.PHONY: pdf-fr
pdf-fr:
	@echo "Compiling French guide - output in build_log_fr"
	@docker run \
		--rm \
		-ti \
		-v $(shell pwd):/guide:rw \
		-w /guide \
		--hostname ba-guide \
		ba-guide:$(VERSION) \
		/bin/sh -c "lualatex \
			    ${srcdir}/blackarch-guide-fr.tex 1>./build_log_fr; \
			    lualatex \
			    ${srcdir}/blackarch-guide-fr.tex 1>>./build_log_fr"

.PHONY: pdf-it
pdf-it:
	@echo "Compiling Italian guide - output in build_log_it"
	@docker run \
		--rm \
		-ti \
		-v $(shell pwd):/guide:rw \
		-w /guide \
		--hostname ba-guide \
		ba-guide:$(VERSION) \
		/bin/sh -c "lualatex \
			    ${srcdir}/blackarch-guide-it.tex 1>./build_log_it; \
			    lualatex \
			    ${srcdir}/blackarch-guide-it.tex 1>>./build_log_it"

.PHONY: pdf-pt-br
pdf-pt-br:
	@echo "Compiling Brazilian guide - output in build_log_pt-br"
	@docker run \
		--rm \
		-ti \
		-v $(shell pwd):/guide:rw \
		-w /guide \
		--hostname ba-guide \
		ba-guide:$(VERSION) \
		/bin/sh -c "lualatex \
			    ${srcdir}/blackarch-guide-pt-br.tex 1>./build_log_pt-br; \
			    lualatex \
			    ${srcdir}/blackarch-guide-pt-br.tex 1>>./build_log_pt-br"

.PHONY: pdf-ru
pdf-ru:
	@echo "Compiling Russian guide - output in build_log_ru"
	@docker run \
		--rm \
		-ti \
		-v $(shell pwd):/guide:rw \
		-w /guide \
		--hostname ba-guide \
		ba-guide:$(VERSION) \
		/bin/sh -c "lualatex \
			    ${srcdir}/blackarch-guide-ru.tex 1>./build_log_ru; \
			    lualatex \
			    ${srcdir}/blackarch-guide-ru.tex 1>>./build_log_ru"

.PHONY: pdf-tr
pdf-tr:
	@echo "Compiling Turkish guide - output in build_log_tr"
	@docker run \
		--rm \
		-ti \
		-v $(shell pwd):/guide:rw \
		-w /guide \
		--hostname ba-guide \
		ba-guide:$(VERSION) \
		/bin/sh -c "lualatex \
			    ${srcdir}/blackarch-guide-tr.tex 1>./build_log_tr; \
			    lualatex \
			    ${srcdir}/blackarch-guide-tr.tex 1>>./build_log_tr"

.PHONY: pdf-zh
pdf-zh:
	@echo "Compiling Chinese guide - output in build_log_zh"
	@docker run \
		--rm \
		-ti \
		-v $(shell pwd):/guide:rw \
		-w /guide \
		--hostname ba-guide \
		ba-guide:$(VERSION) \
		/bin/sh -c "lualatex \
			    ${srcdir}/blackarch-guide-zh.tex 1>./build_log_zh; \
			    lualatex \
			    ${srcdir}/blackarch-guide-zh.tex 1>>./build_log_zh"

# generate for all languages
.PHONY: pdf
pdf: pdf-de pdf-el pdf-en pdf-es pdf-fr pdf-it pdf-pt-br pdf-ru pdf-tr pdf-zh
