# fortran-git
A collection of Fortran 2008 ISO C binding interfaces to
[libgit2](https://github.com/libgit2/libgit2).

## Build Instructions
Install *libgit2* either as a package or build the library from source with
CMake:

```
$ git clone --depth 1 https://github.com/libgit2/libgit2
$ cd libgit2/
$ mkdir build && cd build/
$ cmake ..
$ cmake --build .
```

This step creates the shared library `libgit2.so.*` in directory `build/`. Link
against the library and the header files in `./include/` (if not installed
globally).

Clone the *fortran-git* repository and build the static library
`libfortran-git.a` (containing the Fortran interface bindings), either with
*fpm* or GNU/BSD make:

```
$ git clone --depth 1 https://github.com/integerkosmos/fortran-git
$ cd fortran-git/
$ fpm build
```

With make instead:

```
$ make FC=ifort
```

## Licence
MIT
