## Semester Project:
Our project will involve compiling the linux kernel with different parameters (namely varying HZ), and measuring its impact on performance.
The problem is primarily that it's not clear what degree of performance advantage is gained from this parameter, and also unclear if there's
a noticible decline in responsiveness, OS resource management, etc. Ideally, developers of resource-constrained embedded Linux systems would
use our results to chose the best kernel configuration for their use case, and will also use the toolchain we develop to do their own further
investigation. We intend to provide both to our github repo.

## Creating the Linux Kernel:
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

  
 ## Utilizing our benchmarking program:
- When using a ubuntu distribution of linux: 
>sudo apt install sysbench
 
- Create file for testing named sysbench_testing_bashscript.sh: 
 >touch sysbench_testing_bashscript.sh
 
- Put our file sysbench_testing_bashcscript.sh into your similarly named file: see sysbench_testing_bashscript.sh
 	
- Run the file in terminal through one of the following commands:
>./sysbench_testing_bashscript.sh

Or
 
>bash sysbench_testing_bashscript.sh
 
- The code should proceed to run the benchmarking tests and display the output on your given system.

## Conclusions:
After running our tests, with example tests attached elsewhere in the repository, we found an interesting trend between the average percentage difference in performance for a machine depending on the number of threads tested by our program.
When testing only one thread, the 100HZ kernel performed an average of 1% faster than the 1000HZ kernel on nearly every benchmark. 
However, the opposite became true when we tested 16 threads with the program resulting in an average 1% faster performance of the 1000HZ kernel compared to the 100HZ kernel.
This leads us toward the conclusion that for low resource machines there is an advantage in lowering the HZ refresh rate, despite only being a minor improvement.
