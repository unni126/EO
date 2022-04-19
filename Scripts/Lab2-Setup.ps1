
echo off 

Set-Variable -Name basedir -Value $PWD.Path
Set-Variable -Name grafanapath -Value ($basedir +"\grafana")
Set-Variable -Name grafanazip -Value ($basedir +"\grafana.zip")
Set-Variable -Name grafanadir -Value ($grafanapath +"\grafana-8.4.0")

if(![System.IO.Directory]::Exists($grafanadir)){
    echo "Downloading grafana"
    Invoke-Webrequest https://dl.grafana.com/enterprise/release/grafana-enterprise-8.4.0.windows-amd64.zip -Outfile grafana.zip
    echo "Done"
}

if([System.IO.File]::Exists($grafanazip)){
    echo "Unzipping grafana files"
    Expand-Archive $grafanazip
    move $grafanadir $basedir
    rm $grafanapath
    rm $grafanazip
    echo "Done"
}