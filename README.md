## Semester Project:
Our project will involve compiling the linux kernel with different parameters (namely varying HZ), and measuring its impact on performance.
The problem is primarily that it's not clear what degree of performance advantage is gained from this parameter, and also unclear if there's
a noticible decline in responsiveness, OS resource management, etc. Ideally, developers of resource-constrained embedded Linux systems would
use our results to chose the best kernel configuration for their use case, and will also use the toolchain we develop to do their own further
investigation. We intend to provide both to our github repo.
  
 ## Utilizing our benchmarking program:
When using a ubuntu distribution of linux: 
>sudo apt install sysbench
 
Create file for testing named sysbench_testing_bashscript.sh: 
 >touch sysbench_testing_bashscript.sh
 
Put our file sysbench_testing_bashcscript.sh into your similarly named file: see sysbench_testing_bashscript.sh
 	
Run the file in terminal through one of the following commands:
>./sysbench_testing_bashscript.sh

Or
 
>bash sysbench_testing_bashscript.sh
 
The code should proceed to run the benchmarking tests and display the output on your given system.
