.POSIX:
.SUFFIXES:

FC      = gfortran
AR      = ar
PREFIX  = /usr/local
FFLAGS  = -Wall -std=f2008 -fcheck=all -fmax-errors=1
LDFLAGS = -I$(PREFIX)/include/ -L$(PREFIX)/lib/
LDLIBS  = -lgit2
ARFLAGS = rcs
TARGET  = libfortran-git.a

.PHONY: all clean

all: $(TARGET)

$(TARGET):
	$(FC) $(FFLAGS) -c src/git2_apply.f90
	$(FC) $(FFLAGS) -c src/git2_buffer.f90
	$(FC) $(FFLAGS) -c src/git2_errors.f90
	$(FC) $(FFLAGS) -c src/git2_global.f90
	$(FC) $(FFLAGS) -c src/git2_oid.f90
	$(FC) $(FFLAGS) -c src/git2_proxy.f90
	$(FC) $(FFLAGS) -c src/git2_remote.f90
	$(FC) $(FFLAGS) -c src/git2_strarray.f90
	$(FC) $(FFLAGS) -c src/git2_types.f90
	$(FC) $(FFLAGS) -c src/git2_checkout.f90
	$(FC) $(FFLAGS) -c src/git2_clone.f90
	$(FC) $(FFLAGS) -c src/git2_annotated_commit.f90
	$(FC) $(FFLAGS) -c src/git2_repository.f90
	$(FC) $(FFLAGS) -c src/git2.f90
	$(AR) $(ARFLAGS) $(TARGET) *.o

discover: $(TARGET)
	$(FC) $(FFLAGS) $(LDFLAGS) -o examples/discover/discover examples/discover/discover.f90 $(TARGET) $(LDLIBS)

init: $(TARGET)
	$(FC) $(FFLAGS) $(LDFLAGS) -o examples/init/init examples/init/init.f90 $(TARGET) $(LDLIBS)

open: $(TARGET)
	$(FC) $(FFLAGS) $(LDFLAGS) -o examples/open/open examples/open/open.f90 $(TARGET) $(LDLIBS)

clean:
	if [ `ls -1 *.mod 2>/dev/null | wc -l` -gt 0 ]; then rm *.mod; fi
	if [ `ls -1 *.o 2>/dev/null | wc -l` -gt 0 ]; then rm *.o; fi
	if [ -e $(TARGET) ]; then rm $(TARGET); fi
	if [ -e ./examples/discover/discover ]; then rm ./examples/discover/discover; fi
	if [ -e ./examples/init/init ]; then rm ./examples/init/init; fi
	if [ -e ./examples/open/open ]; then rm ./examples/open/open; fi
