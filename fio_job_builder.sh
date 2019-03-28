#FIO job builder script that provides a formatted job name field for additional Splunk metadata during the analysis process
# adds hostname, job_sizemb, job_num, job_type

#!/bin/bash

rw=$1
size=$2
numjobs=$3
help="usage 1st argument randrw|randwrite|randread 2nd argument size in MB 3rd argument is number of jobs/threads to run"

echo $help

echo -e '; -- start job file --
[splunk-fio-'$HOSTNAME'-$'2'-'$3'j-'$1']
ioengine=libaio
iodepth=16
bssplit=4k/50:8k/:32k/
direct=1
rw='$1'
size='$2'
numjobs='$3'
; -- end job file --' > fio_jobs/splunk-test-$HOSTNAME-$2-$3j-$1.fio.job
