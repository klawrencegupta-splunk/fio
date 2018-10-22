#!/usr/bin/python
#Kate Lawrence-Gupta
#Splunk
#FIO wrapper script - will send results to HEC endpoint


import subprocess
import datetime
import re
import sys
import json
import requests

now = datetime.datetime.now()
tds = str(now)

fio_job_name = sys.argv[1] #name of fio job to load/run
access_token = sys.argv[2] #access token
url = sys.argv[3] #base url with port
fio_file = "fio_results.json"
fio_params =  " --output-format=json"

def hec_post(fio_file):
    with open (fio_file, "r") as file:
         data=file.read().replace('\n', '')
    base_url = url+'/services/collector/raw?sourcetype=fio'
    response = requests.post(base_url,
      headers={'Content-Type':'application/json',
               'Authorization': 'Splunk {}'.format(access_token)},verify=False,data=data)
    print(response.text)
    print(response.status_code, response.reason) #HTTP

def format_post(fio_payload):
    fio_results = open(fio_file, 'w')
    payload = str(fio_payload)
    content = fio_results.write(str(payload))
    return content


def fio(fio_job_name):
    fio_cmd = "fio " + fio_job_name + fio_params
    fio = subprocess.Popen(fio_cmd,bufsize=512,shell=True, stderr=subprocess.PIPE, stdout=subprocess.PIPE)
    return_code = fio.wait()
    fio_payload = str(fio.stdout.read())
    return fio_payload


if __name__ == '__main__':
    fio_payload = fio(fio_job_name)
    fio_hec_payload = format_post(fio_payload)
    hec_post(fio_file)