$myHostname = $env:COMPUTERNAME
echo "Retreiving running SQL Server services on $myHostname"
$msq_services = Get-Service -ComputerName $myHostname | Where-Object {$_.Name -match "SQL"} | Select-Object DisplayName
# This gets all the Running MSQ Services into an array.
#echo "Current Running MSQ Services" $msq_services
foreach ($service in $msq_services )
{
    $serviceName = $service | Select-Object -ExpandProperty DisplayName
    echo "Checking " $serviceName 
    if($serviceName -match "Poly" )
    {
        #echo "Polybase Service identified: "$serviceName.ToString()
        echo "Stopping Service: "+$serviceName
        Stop-Service $serviceName
    }
    
}