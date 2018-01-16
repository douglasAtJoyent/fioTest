# fioTest
This will have a set of fio tests. This will be used to create the docker image to test network storage.


Test setup
1. Create a file, e.g. env.sh
2. In the file add the variables from this table, and set the values

| Variable      | Type          |Description    | 
| ------------- | ------------- | ------------- |
| THREADS       | int           | The number of threads to use for this test.  |
| TIME          | int           | The amount of time  |
| FILE_NUM      | int           | The number of files that the test will use. This is effective in both read and write tests |
| SIZE          | String        | The total size of the files that you want to use, i.e. if you have 10 files and 100K each file will be 10K. Also one can use K,M,G to denote kilobyte, megabyte, and gigabyte.  |
| DIR           | String .      | The directory in where you want to conduct the test. |
| TYPE          | String        | This should be either local or network, it really just effects the filename of the result. The reason for this is if you want a comparison for severalt tests comparing local and network drives this will help denote the results file. |

The available tests are : 
- singleFileReadWrite.fio  
- singleWrite.fio
- singleWriteConcurrentRead.fio  
- singleWriteMnt.fio

To run a test run the command :
 docker run -it -v temp:/mnt/temp --env-file=env.sh douglasatjoyent/fiotest fio /fioTest/singleWrite.fio 

Note: this is specific for a network test, the -v will create and mount a volume.

An example of the output : 
```

fio-2.16
Starting 1 process
write_single_mounted_disk: Laying out IO file(s) (1 file(s) / 0MB)
fopen log: No such file or directory[0KB/416.4MB/0KB /s] [0/107K/0 iops] [eta 00m:00s]

write_single_mounted_disk: (groupid=0, jobs=1): err= 0: pid=92556: Fri Dec 15 22:11:45 2017
  write: io=45533MB, bw=388543KB/s, iops=97135, runt=120001msec
    slat (usec): min=0, max=163938, avg= 6.67, stdev=127.38
    clat (usec): min=0, max=92218, avg= 2.45, stdev=71.15
     lat (usec): min=3, max=163954, avg= 9.57, stdev=146.49
    clat percentiles (usec):
     |  1.00th=[    0],  5.00th=[    0], 10.00th=[    0], 20.00th=[    0],
     | 30.00th=[    1], 40.00th=[    1], 50.00th=[    1], 60.00th=[    1],
     | 70.00th=[    1], 80.00th=[    1], 90.00th=[    5], 95.00th=[    7],
     | 99.00th=[   17], 99.50th=[   33], 99.90th=[  207], 99.95th=[  262],
     | 99.99th=[  756]
    bw (MB  /s): min=    0, max= 4000, per=100.00%, avg=2243.93, stdev=1854.97
    lat (usec) : 2=80.29%, 4=2.09%, 10=15.71%, 20=1.07%, 50=0.43%
    lat (usec) : 100=0.25%, 250=0.12%, 500=0.04%, 750=0.01%, 1000=0.01%
    lat (msec) : 2=0.01%, 4=0.01%, 10=0.01%, 20=0.01%, 50=0.01%
    lat (msec) : 100=0.01%
  cpu          : usr=19.01%, sys=24.54%, ctx=12188781, majf=0, minf=0
  IO depths    : 1=100.0%, 2=0.0%, 4=0.0%, 8=0.0%, 16=0.0%, 32=0.0%, >=64=0.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     issued    : total=r=0/w=11656378/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
     latency   : target=0, window=0, percentile=100.00%, depth=1

Run status group 0 (all jobs):
  WRITE: io=45533MB, aggrb=388542KB/s, minb=388542KB/s, maxb=388542KB/s, mint=120001msec, maxt=120001msec
  ```

The last line is probably the most useful. It is a summary of test. As one can see the this ran for 2 minutes, and during the tests it was wrote 45533MB at a maximum rate of maxb=388542KB/s or .3 GB/s. This is just a sample result, the test here is not meant to reflect the acutal time this test would normally run nor are the results a refelection of a test ran under normal conditions. This test was ran under a COAL version, and is here only as a sample.

