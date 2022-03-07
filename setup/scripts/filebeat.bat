@echo off
title Filebeat
cd C:\apps\filebeat-8.0.0
powershell.exe -executionpolicy unrestricted -File C:\apps\filebeat-8.0.0\install-service-filebeat.ps1
sc start "Filebeat"