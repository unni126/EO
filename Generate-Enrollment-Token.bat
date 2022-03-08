@echo off
title Elasticsearch
cd C:\apps\elasticsearch-8.0.0\bin
cmd /k elasticsearch-create-enrollment-token.bat --scope kibana