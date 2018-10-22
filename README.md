# fio
FIO

Python wrapper for FIO that will post JSON contents to a Splunk HEC collector. Takes the following argument:

python fio_splunk_hec.py "path to fio job file" "Splunk HEC Token" "https://<dns/ip of HEC endpoint>:8088"
  
This will post JSON output to Splunk with the sourcetype "fio" for search/analysis
