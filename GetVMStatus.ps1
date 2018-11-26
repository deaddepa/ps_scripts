Login-AzureRmAccount
$resgroupName = Get-AzureRmResourceGroup | Select-Object -ExpandProperty ResourceGroupName
Write-Output "Resource Group info: $resgroupName"
foreach($resgroup in $resgroupName)
{
    $VMS = Get-AzureRmVM -ResourceGroupName $resgroup | Select-Object -ExpandProperty Name
    foreach($vm in $VMS)
    {
        $vmStatuses=Get-AzureRMVM -Name $vm -ResourceGroupName $resgroup -Status
        #Write-Output $vmStatuses
        foreach($vmStatus in $vmStatuses)
        {
            $VMStatusDetail = $vmStatus.Statuses[1].Code
            Write-Output "VM: $vm Status: $VMStatusDetail"
        }
    }
}
Logout-AzureRmAccount