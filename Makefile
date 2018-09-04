PWD=$(shell pwd)
BUILDDIR = $(PWD)/_build

build:
	@echo BUILDDIR: $(PWD)
	mkdir -p $(BUILDDIR)
# Compile object file
	cp bullet_ocaml_wrapper.ml _build/bullet_ocaml_wrapper.ml
	cd _build; ocamlopt -c bullet_ocaml_wrapper.ml
	x86_64-w64-mingw32-g++ -fno-exceptions -I$(OCAMLLIB) -IE:/esy-bullet/node_modules/.cache/_esy/store/b/esy_bullet-0.1.0-cdc154d0/bullet3/src -c ./bullet_wrapper.c -o $(BUILDDIR)/bullet_wrapper.o
	ocamlmklib -o $(BUILDDIR)/bullet_wrapper_stubs $(BUILDDIR)/bullet_wrapper.o -cclib -lstdc++
# Build .a
#cd _build; ocamlmklib -custom -o bullet bullet_ocaml_wrapper.cmx bullet_wrapper.o -lLinearMath -lBulletCollision -lBulletDynamics -L$(PWD)/lib
	cp test.ml _build/test.ml
	cd _build; ocamlopt -c test.ml
#cd _build; ocamlopt -o test bullet_ocaml_wrapper.cmx test.cmx -cclib -lbullet_wrapper_stubs -cclib -lLinearMath -cclib -lBulletCollision -cclib -lBulletDynamics -ccopt -L. -ccopt -LC:/Windows/system32 -ccopt -LE:/esy-bullet/node_modules/.cache/_esy/store/b/esy_bullet-0.1.0-cdc154d0/bullet3/lib -ccopt -L/usr/x86_64-w64-mingw32/sys-root/mingw/lib
	# cd _build; ocamlmklib -custom -o derp out.o
	cd _build; ocamlopt -o test bullet_ocaml_wrapper.cmx test.cmx -cclib -lbullet_wrapper_stubs -ccopt -L$(BUILDDIR) -ccopt -L/usr/x86_64-w64-mingw32/sys-root/mingw/lib -cclib -lLinearMath -cclib -lBulletCollision -cclib -lpthread -cclib -lgcc_eh -cclib -lstdc++ -ccopt -LE:/esy-bullet/node_modules/.cache/_esy/store/b/esy_bullet-0.1.0-cdc154d0/bullet3/lib
