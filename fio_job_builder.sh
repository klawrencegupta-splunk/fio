# a quick and dirty bash wrapper to build FIO job files by supplying job type (randrw|randwrite|randread), size in mb (m), number of jobs
#!/bin/bash

rw=$1
size=$2
numjobs=$3
help="usage 1st argument randrw|randwrite|randread 2nd argument size in MB 3rd argument is number of jobs/threads to run"

echo $help

echo -e '; -- start job file --
[splunk-fio-'$2'-'$3'j-'$1']
ioengine=libaio
iodepth=16
bssplit=4k/50:8k/:32k/
direct=1
rw='$1'
size='$2'
numjobs='$3'
; -- end job file --' > fio_jobs/splunk-test-$2m-$3j-$1.fio.job
