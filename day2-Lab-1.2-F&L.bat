#@echo off
cd C:\apps\logstash-8.0.0\config
mkdir certs
xcopy /s C:\apps\elasticsearch-8.0.0\config\certs C:\apps\logstash-8.0.0\config\certs
cd C:\apps
start setup\scripts\filebeat.bat
start setup\scripts\logstash.bat
