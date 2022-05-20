echo off

Set-Variable -Name basedir -Value $PWD.Path
Set-Variable -Name prometheuspath -Value ($basedir +"\prometheus")
Set-Variable -Name prometheuszip -Value ($basedir +"\prometheus.zip")
Set-Variable -Name prometheusdir -Value ($prometheuspath +"\prometheus-2.33.3")
Set-Variable -Name eurekaserverdir -Value ($basedir +"\eureka-server")
Set-Variable -Name vehicleservicedir -Value ($basedir +"\vehicle-service")
Set-Variable -Name checkoutservicedir -Value ($basedir +"\checkout-service")
Set-Variable -Name inventoryservicedir -Value ($basedir +"\inventory-service")
Set-Variable -Name customerservicedir -Value ($basedir +"\customer-service")
Set-Variable -Name creditservicedir -Value ($basedir +"\credit-service")
Set-Variable -Name prometheusconfig -Value "C:\apps\setup\configs\prometheus.yml"


if(![System.IO.Directory]::Exists($eurekaserverdir)){
    git clone -q 'https://github.com/joegalley/eureka-server.git'
    echo "cloned eureka-server"
}

if(![System.IO.Directory]::Exists($vehicleservicedir)){
    git clone -q 'https://github.com/joegalley/vehicle-service.git'
    echo "cloned vehicle-service"
}

if(![System.IO.Directory]::Exists($checkoutservicedir)){
    git clone -q 'https://github.com/joegalley/checkout-service.git'
    echo "cloned checkout-service"
}

if(![System.IO.Directory]::Exists($inventoryservicedir)){
    git clone -q 'https://github.com/joegalley/inventory-service.git'
    echo "cloned inventory-service"
}

if(![System.IO.Directory]::Exists($customerservicedir)){
    git clone -q 'https://github.com/joegalley/customer-service.git'
    echo "cloned customer-service"
}

if(![System.IO.Directory]::Exists($creditservicedir)){
    git clone -q 'https://github.com/joegalley/credit-service.git'
    echo "cloned credit-service"
}

#Download prometheus
if(![System.IO.Directory]::Exists($prometheusdir)){
    echo "Downloading prometheus"
    Invoke-Webrequest https://github.com/prometheus/prometheus/releases/download/v2.33.3/prometheus-2.33.3.windows-amd64.zip -Outfile prometheus.zip
    echo "Done"
}


if([System.IO.File]::Exists($prometheuszip)){
    echo "Unzipping prometheus files"
    Expand-Archive $prometheuszip
    Rename-Item ($prometheusdir +".windows-amd64") -NewName "prometheus-2.33.3"
    move $prometheusdir $basedir
    rm $prometheuspath
    rm $prometheuszip
    echo "Done"
}

#set the configuration
if([System.IO.Directory]::Exists($prometheusdir)){
    echo "Updating prometheus config file"
    cd prometheus-2.33.3
    cp -v $prometheusconfig    
    cd $basedir
    echo "Done"
}
#set the configuration
