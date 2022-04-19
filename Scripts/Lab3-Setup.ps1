echo off

#set the variables
Set-Variable -Name "basepath" -Value $PWD.Path

Set-Variable -Name filebeatpath -Value ($basepath +"\filebeat")
Set-Variable -Name logstashpath -Value ($basepath +"\logstash")
Set-Variable -Name elasticsearchpath -Value ($basepath +"\elasticsearch")
Set-Variable -Name kibanapath -Value ($basepath +"\kibana")

Set-Variable -Name filebeatdir -Value ($basepath +"\filebeat-8.0.0")
Set-Variable -Name logstashdir -Value ($basepath +"\logstash-8.0.0")
Set-Variable -Name elasticsearchdir -Value ($basepath +"\elasticsearch-8.0.0")
Set-Variable -Name kibanadir -Value ($basepath +"\kibana-8.0.0")

Set-Variable -Name filebeatzip -Value ($filebeatpath +".zip")
Set-Variable -Name logstashzip -Value ($logstashpath +".zip")
Set-Variable -Name elasticsearchzip -Value ($elasticsearchpath +".zip")
Set-Variable -Name kibanazip -Value ($kibanapath +".zip")

Set-Variable -Name filebeatconfig -Value "C:\apps\setup\configs\filebeat.yml"
Set-Variable -Name logstashconfig -Value "C:\apps\setup\configs\logstash.conf"
Set-Variable -Name certpath -Value ($basepath +"\logstash-8.0.0\config")

#set the variables

#download filebeat
if(![System.IO.Directory]::Exists($filebeatdir)){
    echo "Downloading filebeat"
    Invoke-Webrequest https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-8.0.0-windows-x86_64.zip -Outfile filebeat.zip
    echo "Done"
}
#download filebeat

#unzip files
if([System.IO.File]::Exists($filebeatzip)){
    echo "Unzipping filebeat"
    Expand-Archive $filebeatzip
    Rename-Item ($filebeatpath +"\filebeat-8.0.0-windows-x86_64") -NewName "filebeat-8.0.0"
    move ($filebeatpath +"\filebeat-8.0.0") $basepath
    rm $filebeatpath
    rm $filebeatzip
    echo "Done"
}
#unzip files

#set the configuration
if([System.IO.Directory]::Exists($filebeatdir)){
    echo "Updating config file filebeat"
    cd filebeat-8.0.0
    cp -v $filebeatconfig
    cd $basepath
    echo "Done"
}
#set the configuration


#download logstash
if(![System.IO.Directory]::Exists($logstashdir)){
    echo "Downloading logstash"
    Invoke-Webrequest https://artifacts.elastic.co/downloads/logstash/logstash-8.0.0-windows-x86_64.zip -Outfile logstash.zip
    echo "Done"
}
#download logstash



#unzip files
if([System.IO.File]::Exists($logstashzip)){
    echo "unzipping logstash"
    Expand-Archive $logstashzip
    move ($logstashpath+"\logstash-8.0.0") $basepath
    rm $logstashpath
    rm $logstashzip
    echo "Done"
}
#unzip files

#set the configuration
if([System.IO.Directory]::Exists($logstashdir)){
    echo "Updating config file logstash"
    cd logstash-8.0.0\config
    cp -v $logstashconfig
    mkdir certs
    cd certs
    cp -v "C:\apps\setup\certs\http.p12"
    cp -v "C:\apps\setup\certs\http_ca.crt"
    cp -v "C:\apps\setup\certs\transport.p12"
    cd $basepath
    echo "Done"
}
#set the configuration

#download elasticsearch
if(![System.IO.Directory]::Exists($elasticsearchdir)){
    echo "Downloading elasticsearch"
    Invoke-Webrequest https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-8.0.0-windows-x86_64.zip -Outfile elasticsearch.zip
    echo "Done"
}
#download elasticsearch


#Unzip files
if([System.IO.File]::Exists($elasticsearchzip)){
    echo "unzipping elasticsearch"
    Expand-Archive $elasticsearchzip
    move ($elasticsearchpath + "\elasticsearch-8.0.0") $basepath
    rm $elasticsearchpath
    rm $elasticsearchzip
    echo "Done"
}
#Unzip files


#download kibana
if(![System.IO.Directory]::Exists($kibanadir)){
    echo "downloading kibana"
    Invoke-Webrequest https://artifacts.elastic.co/downloads/kibana/kibana-8.0.0-windows-x86_64.zip -Outfile kibana.zip
    echo "completed downloading kibana"
}
#download kibana

#unzip files
if([System.IO.File]::Exists($kibanazip)){
    echo "unzipping kibana"
    Expand-Archive $kibanazip
    move ($kibanapath + "\kibana-8.0.0") $basepath
    rm $kibanapath
    rm $kibanazip
    echo "Done"
}
#unzip files
