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

**fio_analyzer**

FIO Analyzer SH app with FIO Results dashboard. Current Metrics:
- Read IOPS
- Write IOPS
- IO Depth
- Disk Util % (during testing - all threads)
- Latency & Bandwidth Stats
- CPU Utilization 
