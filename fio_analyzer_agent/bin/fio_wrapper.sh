#!/bin/bash

#/usr/bin/python $SPLUNK_HOME/etc/apps/fio_analyzer_agent/bin/fio_splunk_hec.py $SPLUNK_HOME/etc/apps/fio_analyzer_agent/local/randomrw_fio.job "b82915de-8c4b-4924-ba4e-ee956bb3435f"  "https://10.202.33.135:8088"
for x in $(ls -1 $SPLUNK_HOME/etc/apps/fio_analyzer_agent/local/*.job); do /usr/bin/python $SPLUNK_HOME/etc/apps/fio_analyzer_agent/bin/fio_splunk_hec.py $x "b82915de-8c4b-4924-ba4e-ee956bb3435f" "https://10.202.33.135:8088"; done
