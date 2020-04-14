SHELL = /bin/sh
.PHONY: all build clean deps html install
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

# make html files
html:
	@tput setaf 3; echo "this needs to be implemented"
	@tput setaf 10


PHONY: lint-de
lint-de:
	@echo "==========================================="
	@echo "= linting German Guide                    ="
	@echo "==========================================="
	@docker run \
		--rm \
		-ti \
		-v $(shell pwd):/guide:rw \
		-w /guide \
		--hostname ba-guide \
		ba-guide:$(VERSION) \
		/bin/sh -c "chktex ${srcdir}/*-de.tex; exit 0"

PHONY: lint-el
lint-el:
	@echo "==========================================="
	@echo "= linting Greek Guide                     ="
	@echo "==========================================="
	@docker run \
		--rm \
		-ti \
		-v $(shell pwd):/guide:rw \
		-w /guide \
		--hostname ba-guide \
		ba-guide:$(VERSION) \
		/bin/sh -c "chktex ${srcdir}/*-el.tex; exit 0"


PHONY: lint-en
lint-en:
	@echo "==========================================="
	@echo "= linting English Guide                   ="
	@echo "==========================================="
	@docker run \
		--rm \
		-ti \
		-v $(shell pwd):/guide:rw \
		-w /guide \
		--hostname ba-guide \
		ba-guide:$(VERSION) \
		/bin/sh -c "chktex ${srcdir}/*-en.tex; exit 0" \

PHONY: lint-es
lint-es:
	@echo "==========================================="
	@echo "= linting Spanish Guide                   ="
	@echo "==========================================="
	@docker run \
		--rm \
		-ti \
		-v $(shell pwd):/guide:rw \
		-w /guide \
		--hostname ba-guide \
		ba-guide:$(VERSION) \
		/bin/sh -c "chktex ${srcdir}/*-es.tex; exit 0"

PHONY: lint-fr
lint-fr:
	@echo "==========================================="
	@echo "= linting French Guide                    ="
	@echo "==========================================="
	@docker run \
		--rm \
		-ti \
		-v $(shell pwd):/guide:rw \
		-w /guide \
		--hostname ba-guide \
		ba-guide:$(VERSION) \
		/bin/sh -c "chktex ${srcdir}/*-fr.tex; exit 0"

PHONY: lint-it
lint-it:
	@echo "==========================================="
	@echo "= linting Italian Guide                   ="
	@echo "==========================================="
	@docker run \
		--rm \
		-ti \
		-v $(shell pwd):/guide:rw \
		-w /guide \
		--hostname ba-guide \
		ba-guide:$(VERSION) \
		/bin/sh -c "chktex ${srcdir}/*-it.tex; exit 0"

PHONY: lint-pt-br
lint-pt-br:
	@echo "==========================================="
	@echo "= linting Brazilian Guide                 ="
	@echo "==========================================="
	@docker run \
		--rm \
		-ti \
		-v $(shell pwd):/guide:rw \
		-w /guide \
		--hostname ba-guide \
		ba-guide:$(VERSION) \
		/bin/sh -c "chktex ${srcdir}/*-pt-br.tex; exit 0"

PHONY: lint-ro
lint-ro:
	@echo "==========================================="
	@echo "= linting Romanian Guide                 ="
	@echo "==========================================="
	@docker run \
		--rm \
		-ti \
		-v $(shell pwd):/guide:rw \
		-w /guide \
		--hostname ba-guide \
		ba-guide:$(VERSION) \
		/bin/sh -c "chktex ${srcdir}/*-ro.tex; exit 0"

PHONY: lint-ru
lint-ru:
	@echo "==========================================="
	@echo "= linting Russian Guide                   ="
	@echo "==========================================="
	@docker run \
		--rm \
		-ti \
		-v $(shell pwd):/guide:rw \
		-w /guide \
		--hostname ba-guide \
		ba-guide:$(VERSION) \
		/bin/sh -c "chktex ${srcdir}/*-ru.tex; exit 0"

PHONY: lint-tr
lint-tr:
	@echo "==========================================="
	@echo "= linting Turkish Guide                   ="
	@echo "==========================================="
	@docker run \
		--rm \
		-ti \
		-v $(shell pwd):/guide:rw \
		-w /guide \
		--hostname ba-guide \
		ba-guide:$(VERSION) \
		/bin/sh -c "chktex ${srcdir}/*-tr.tex; exit 0"

PHONY: lint-zh
lint-zh:
	@echo "==========================================="
	@echo "= linting Chinese Guide                   ="
	@echo "==========================================="
	@docker run \
		--rm \
		-ti \
		-v $(shell pwd):/guide:rw \
		-w /guide \
		--hostname ba-guide \
		ba-guide:$(VERSION) \
		/bin/sh -c "chktex ${srcdir}/*-zh.tex; exit 0"

# run the latex linting tool
.PHONY: lint
lint: lint-de lint-el lint-en lint-es lint-fr lint-it lint-pt-br lint-ru lint-tr lint-zh

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

.PHONY: pdf-ro
pdf-ro:
	@echo "Compiling Romanian guide - output in build_log_ro"
	@docker run \
		--rm \
		-ti \
		-v $(shell pwd):/guide:rw \
		-w /guide \
		--hostname ba-guide \
		ba-guide:$(VERSION) \
		/bin/sh -c "lualatex \
			    ${srcdir}/blackarch-guide-ro.tex 1>./build_log_ro; \
			    lualatex \
			    ${srcdir}/blackarch-guide-ro.tex 1>>./build_log_ro"

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
