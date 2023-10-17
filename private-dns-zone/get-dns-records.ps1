Connect-AzAccount -TenantId 47af30ab-082e-4ac3-9d2a-adfd52da88ec

#Get DNS records

$subscriptions = Get-AzSubscription -Tenant 47af30ab-082e-4ac3-9d2a-adfd52da88ec

$objectArr = @()

foreach ($subscription in $subscriptions) {

    Set-AzContext $subscription | Out-Null
    $dnszones = Get-AzPrivateDnsZone

    $records = Get-AzPrivateDnsZone | Get-AzPrivateDnsRecordSet
    $records | Export-Csv -Path ".\test_deployments\resources\private-dns-zone\sample-files\dnsrecords_001.csv" -Append

    $records | 
        Select-Object -Property Id, Name, ZoneName, ResourceGroupName, Ttl, RecordType, IsAutoRegistered -ExpandProperty Records | FT
            Export-Csv -Path ".\test_deployments\resources\private-dns-zone\sample-files\dnsrecords_001.csv"


    Set-AzPrivateDnsRecordSet


    $zonerecords = [ordered]@{
        'Subscription Name' = $subscription.Name
        'Resource Group Name' = $zone.ResourceGroupName
        'Private DNS Zone Name' = $zone.Name
        'Records' = $records #| Out-String
    }
    $obj = New-Object -Type PSCustomObject -Property $zonerecords

    $objectArr += $obj


    foreach ($zone in $dnszones) {

        $dnszonerg = $zone.ResourceGroupName
        $records = $zone | Get-AzPrivateDnsRecordSet -ZoneName $_.Name -ResourceGroupName $dnszonerg

                $zonerecords = [ordered]@{
                    'Subscription Name' = $subscription.Name
                    'Resource Group Name' = $zone.ResourceGroupName
                    'Private DNS Zone Name' = $zone.Name
                    'Records' = $records #| Out-String
                }
                $obj = New-Object -Type PSCustomObject -Property $zonerecords

                $objectArr += $obj
            }
    }


# Export array into CSV

$objectArr | Select-Object PrivateDNSRecords
$objectArr | Export-Csv -Path ".\test_deployments\resources\private-dns-zone\sample-files\dnsrecords_001.csv"