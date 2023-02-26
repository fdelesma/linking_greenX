# Linking greenX NOMAD library to FHI-aims code

As greenX is developed to as a stand-alone library available on its [GitHub repository](https://github.com/nomad-coe/greenX), users of FHI-aims can directly use greenX after linking it to FHI-aims during compilation.

## Compiling green-X library 

To build all libraries, set up a build directory, change to it and run cmake configuration:

    mkdir build 
    cd build
    cmake ../

To explicitly specify the compiler, run CMake configure with:

    FC=ifort cmake ../

Shared libraries are built by default. If all requirements are found, build and install the project:

    make -j
    make install

Optionally, define GreenX's root `$GX_ROOT`

    export GX_ROOT=/path/to/greenX

## Compiling FHI-aims with green-X 

**Currently, in order to utilize the greenX library, you need to use the development version of FHI-aims available on its [GitLab repository](https://aims-git.rz-berlin.mpg.de/aims/FHIaims). Running greenX with the current official release (221103) will not work.**

Upon compilation of FHI-aims, include the path to greenX library. 

If compiled via cmake-cache file (as is recommended), include the path to greenX in the `LIB_PATHS` and `INC_PATHS` environment variables:

    set(LIB_PATHS "/path/to/greenX/install/lib" CACHE STRING "")
    set(INC_PATHS "/path/to/greenX/install/include/modules" CACHE STRING "")

Or if you have defined `$GX_ROOT`

    set(LIB_PATHS "$ENV{GX_ROOT}/install/lib" CACHE STRING "")
    set(INC_PATHS "$ENV{GX_ROOT}/install/include/modules" CACHE STRING "")
    
Add `gx_minimax` component of the greenX to the `LIBS` environment variable:

    set(LIBS "gx_minimax name-of-other-lib-1 name-of-other-lib-2" CACHE STRING "")

Enable the linking to greenX:

    set(USE_GREENX ON CACHE BOOL "")

An example of the `initial_cache` file can be find [here](https://github.com/fdelesma/linking_greenX/blob/main/initial_cache.example.cmake). This example compiles FHI-aims with scalapack and greenX libraries.

Switch to the development branch

    git checkout linking_greenX_v1

To build all libraries, set up a build directory, change to it and run cmake configuration:

    mkdir build_greenX
    cd build_greenX
    cmake -C ../initial_cache.example.cmake ..

Finally compile FHI-aims 

    make -j 

## Running greenX in FHI-aims

In order use the minimax grids available in the GreenX library in FHI-aims, two things should be added to `control.in`:

    freq_grid_type minimax
    frequency_points 8

The available grids are multiples of two starting from 6 up to 34
