# Blackarch-Guide Repository

This is part of BlackArch Linux and provides the latex files for the BlackArch
User Guides.

To create a new Guide in in a language create a 
blackarch-guide-<your-country-code>.tex and an appendex-<your-country-code>.tex
file in the latex directory and add the
target to the ```Makefile```.


Everything is compiled in a Docker container, so the only dependency
needed is docker.

-------

### Build
To compile the guides run 
```make docker-build```
```make pdf```

This will compile all guides listed as targets in the ```Makefile```.

##### Current Targets are:
* de
* el
* en
* es
* fr 
* it
* pt-br
* ru
* tr
* zh

You can also build a single guide (e.g. German)
```make pdf-de```

linting is done via
``` make lint```
or for a subtarget (e.g. English) 
```make lint-en```

