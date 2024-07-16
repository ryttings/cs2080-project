#!/bin/bash
thread_options=('--threads=1' '--threads=16')
time_options=('--time=1' '--time=10')
fileio_tests=('seqwr' 'seqrewr' 'seqrd' 'rndrd' 'rndwr' 'rndrw')
block_sizes=('1K' '1M' )
mem_access=('seq' 'rnd')
mem_ops=('read' 'write')
outfile="logs.txt"

for thread_cmd in "${thread_options[@]}"; do
    echo "Running CPU Tests... ($thread_cmd)"
    sysbench $thread_cmd cpu run | grep events
    echo "Running Memory Tests... ($thread_cmd)"
    sysbench $thread_cmd memory run | grep events 
    for size in "${block_sizes[@]}"; do
        echo "Running $size Block Size..."
        echo "Sequential Read (1 second):"
        sysbench $thread_cmd --time=1 --memory-block-size=$size --memory-oper=read --memory-access-mode=seq memory run | grep events 
        echo "Random Read (1 second):"
        sysbench $thread_cmd --time=1 --memory-block-size=$size --memory-oper=read --memory-access-mode=rnd memory run | grep events 
        echo "Sequential Write (1 second):"
        sysbench $thread_cmd --time=1 --memory-block-size=$size --memory-oper=write --memory-access-mode=seq memory run | grep events 
        echo "Random Write (1 second):"
        sysbench $thread_cmd --time=1 --memory-block-size=$size --memory-oper=write --memory-access-mode=rnd memory run | grep events 
    done
    echo "Running File I/O Tests... ($thread_cmd)"
    sysbench $thread_cmd --file-test-mode=seqwr fileio run | grep events 
    echo "Running Thread Subsystem Tests... ($thread_cmd)"
    sysbench $thread_cmd threads run | grep events 
    echo "Running Mutex Tests... ($thread_cmd)"
    sysbench $thread_cmd mutex run | grep -A 13 General
    rm test_file.* #clean up temporary files
done
