Docker Packages, Layers & Images
================================

## Package Repository

- [pkgs.alpinelinux.org](https://pkgs.alpinelinux.org/packages)

## golang v1.17.10

### Base Alpine OS upgrade required to build protos

| Alpine OS  | Notes                                                   | 
| ---------- | ------------------------------------------------------- |
| 3.13       | Used to construct image for compiling protos command    |
| 3.16       | Most docker layers used to construct an image use v3.16 |


### Libs
    
| Package    | From           | To        | Layer | Notes                     |
| ---------- | -------------- | --------- | ----- | ------------------------- |
| build-base | 0.5-r2         | 0.5-r3    |       |                           |
| git        | 2.30.2-r0      | 2.36.6-r0 |       | Command line tool upgrade, common dockerfile dependency |
| libatomic  | 10.2.1_pre1-r3 | 11.2.1_git20220219-r2 | [gcc](https://gcc.gnu.org) [Atomic](https://gcc.gnu.org/wiki/Atomic) | |
| [musl](https://musl.libc.org/#:~:text=musl%20is%20an%20implementation%20of,of%20standards-conformance%20and%20safety.)  | 1.2.2-r0 | 1.2.3-r0 | | C standard library built ontop of Linux system call API |
| [cmake](https://pkgs.alpinelinux.org/packages?name=cmake&branch=v3.16&repo=&arch=&maintainer=)  | 3.18.4-r1 | 3.23.5-r0 | proto | cmake build tool |
| [linux-headers](https://pkgs.alpinelinux.org/packages?name=linux-headers&branch=v3.16&repo=&arch=&maintainer=) | linux-headers-5.16.7-r1 | linux-headers-5.16.7-r1.apk | | |
| [perl](https://pkgs.alpinelinux.org/packages?name=perl&branch=v3.16&repo=&arch=&maintainer)          | perl-5.32.0-r2 | perl-5.34.2-r0.apk | proto | perl interpreter |
    


### git
    
| Package | Branch | Version | Notes |
| ------- | -------| ------- | ----- |
| git | 3.16 | [2.36.6-r0](https://pkgs.alpinelinux.org/packages?name=git&branch=v3.16&repo=&arch=&maintainer=) | |
| git | 3.14 | [2.32.7-r0](https://pkgs.alpinelinux.org/packages?name=git&branch=v3.14&repo=&arch=&maintainer=) | |
| git | 3.13 | [2.30.6-r0](https://pkgs.alpinelinux.org/packages?name=git&branch=v3.13&repo=&arch=&maintainer=) | |
| git | 3.12 | [2.26.3-r1](https://pkgs.alpinelinux.org/packages?name=git&branch=v3.12&repo=&arch=&maintainer=) | |
| git | | [2.24.4-r0](https://pkgs.alpinelinux.org/packages?name=git&branch=v3.11&repo=&arch=&maintainer=) | |

### golang

| Package | Branch | Version | Notes |
| ------- | -------| ------- | ----- |
| golang  | edge   | [1.21.5-r0]() | |
| golang | v3.16 | [1.18.7-r0](https://pkgs.alpinelinux.org/packages?name=go&branch=v3.16&repo=&arch=&maintainer=) | |
| golang | v3.15 | [1.17.10-r0](https://pkgs.alpinelinux.org/packages?name=go&branch=v3.15&repo=&arch=&maintainer=) | |
