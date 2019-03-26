**Splunk FIO Analyzer**

***fio_splunk_hec.py***

Python wrapper for FIO that will post JSON contents to a Splunk HEC collector with the sourcetype "fio" for search/analysis

*usage*:
python fio_splunk_hec.py "path to fio job file" "Splunk HEC Token" "https://<dns/ip of HEC endpoint>:8088"
  
**randomrw_fio.job**

sample fio job with random R/W mix of data for testing

**fio_analyzer_agent**

Splunk UF/HF app that runs fio jobs on 30 second intervals for testing. This job file has been set for small jobs for testing/development.

This is a wrapper/app for the fio_splunk_hec.py script & will send to the HEC endpoint defined in bin/fio_wrapper.sh script

**fio_job_builder.sh*

A shell script that will build out quick and dirty FIO job files by specifying job type, size & number with CLI args

Example:

./fio_job_builder.sh randrw 1024 1

builds

; -- start job file --
[splunk-fio-1024m-1j-randrw]
ioengine=libaio
iodepth=16
bssplit=4k/50:8k/:32k/
direct=1
rw=randrw
size=1024m
numjobs=1
; -- end job file --

The [job name] is important for regex since it provides additional data about job size, number of threads and if it was a randrw job, randwrite or randread type of job that's not provided in the original FIO payload.

**fio_analyzer**

FIO Analyzer SH app with FIO Results dashboard. Current Metrics:
- Read IOPS
- Write IOPS
- IO Depth
- Disk Util % (during testing - all threads)
- Latency & Bandwidth Stats
- CPU Utilization 
