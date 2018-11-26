Get-Service *SQLPB* | Where-Object {$_.Status -eq "Running"} | Stop-Service
#echo $msq_running_services
# All yhe services starting with SQL are now stored in the $msq_services variable

#foreach ($service in $msq_running_services)
#{
#    echo $service
    #Stop-Service -Name $service
#}

Get-Service -DisplayName "*Poly*" | Select Name,Status