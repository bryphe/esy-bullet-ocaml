PWD=$(shell pwd)
BUILDDIR = $(PWD)/_build

build:
	@echo BUILDDIR: $(PWD)
	mkdir -p $(BUILDDIR)
# Compile object file
	cp bullet_ocaml_wrapper.ml _build/bullet_ocaml_wrapper.ml
	cd _build; ocamlopt -c bullet_ocaml_wrapper.ml
	x86_64-w64-mingw32-g++ -I$(OCAMLLIB) -IE:/esy-bullet/node_modules/.cache/_esy/store/b/esy_bullet-0.1.0-cdc154d0/bullet3/src -c ./bullet_wrapper.c -o $(BUILDDIR)/bullet_wrapper.o
	# ocamlmklib -o $(BUILDDIR)/bullet_wrapper_stubs $(BUILDDIR)/bullet_wrapper.o
# Build .a
#cd _build; ocamlmklib -custom -o bullet bullet_ocaml_wrapper.cmx bullet_wrapper.o -lLinearMath -lBulletCollision -lBulletDynamics -L$(PWD)/lib
	cp test.ml _build/test.ml
	cd _build; ocamlopt -c test.ml
#cd _build; ocamlopt -o test bullet_ocaml_wrapper.cmx test.cmx -cclib -lbullet_wrapper_stubs -cclib -lLinearMath -cclib -lBulletCollision -cclib -lBulletDynamics -ccopt -L. -ccopt -LC:/Windows/system32 -ccopt -LE:/esy-bullet/node_modules/.cache/_esy/store/b/esy_bullet-0.1.0-cdc154d0/bullet3/src/LinearMath -ccopt -LE:/esy-bullet/node_modules/.cache/_esy/store/b/esy_bullet-0.1.0-cdc154d0/bullet3/src/BulletCollision -ccopt -LE:/esy-bullet/node_modules/.cache/_esy/store/b/esy_bullet-0.1.0-cdc154d0/bullet3/src/BulletDynamics -ccopt -L/usr/x86_64-w64-mingw32/sys-root/mingw/lib
	cd _build; x86_64-w64-mingw32-ld -r -o out.o bullet_wrapper.o E:/esy-bullet/node_modules/.cache/_esy/store/b/esy_bullet-0.1.0-cdc154d0/bullet3/src/LinearMath/libLinearMath.a E:/esy-bullet/node_modules/.cache/_esy/store/b/esy_bullet-0.1.0-cdc154d0/bullet3/src/BulletCollision/libBulletCollision.a
	cd _build; ocamlmklib -custom -o derp out.o
	cd _build; ocamlopt -o test bullet_ocaml_wrapper.cmx test.cmx -cclib -lderp -ccopt -L$(BUILDDIR) -ccopt -L/usr/x86_64-w64-mingw32/sys-root/mingw/lib -ccopt -lLinearMath -cclib -lpthread -cclib -lgcc_eh -ccopt -lstdc++ -ccopt -LE:/esy-bullet/node_modules/.cache/_esy/store/b/esy_bullet-0.1.0-cdc154d0/bullet3/src/LinearMath
