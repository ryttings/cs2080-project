For the kernel we're compiling -- planning on using Ubuntu kernel if possible.
Also looking into Gentoo compilation.

## Getting the kernel source:
- Used a baseline latest Ubuntu image to compile kernel
- Downloaded the latest [linux kernel tarball](https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-6.10.tar.xz)
    - Could also clone the linux kernel git repository for different versions & version control
- Extracted source
    - `tar -xvf linux-6.10.tar.xz`
- Installed dependencies
    - `sudo apt-get install git fakeroot build-essential ncurses-dev xz-utils libssl-dev bc flex libelf-dev bison`

## .config file changes:
- Ensured following configs were set:
> CONFIG_HZ_PERIODIC=y
> CONFIG_HZ_100=y
> CONFIG_HZ=100
- And ensured the following configs were not set:
> CONFIG_HZ_250
> CONFIG_HZ_300
> CONFIG_HZ_1000
> CONFIG_NO_HZ_IDLE
> CONFIG_NO_HZ_FULL
> CONFIG_NO_HZ

## Building Kernel:
- build the main makefile:
    - `make`
- Install kernel modules:
    - `sudo make modules_install`
- Install the new kernel so we can boot from it:
    - `sudo make install`

