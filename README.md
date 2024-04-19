# ZStandard for D

This package provides a DUB based build script to build the static library version of ZStandard from the original source repository for use with the D programming language. ImportC is used to generate a DI file from the original C headers.

## Build

To build this package simply run `dub run` on a supported platform. The resulting library files will be placed in the `lib` folder.

### Supported Platforms

1. Windows (x86/x64)
2. ~~Linux (x86/x64)~~ (Coming soon)
