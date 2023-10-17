Connect-AzAccount -TenantId 47af30ab-082e-4ac3-9d2a-adfd52da88ec

#AH-Playground

Select-AzSubscription -Subscription 34ddcb84-9987-4faf-9960-e5742853cb94

New-AzResourceGroupDeployment -ResourceGroupName rg-uks-JosuedaSilva -TemplateFile "C:\Users\josue.dasilva\OneDrive - Cognizant LZ1\DevOps\ARM Deploy\test_deployments\resources\private-dns-zone\private-dns-zone.json" -TemplateParameterFile "C:\Users\josue.dasilva\OneDrive - Cognizant LZ1\DevOps\ARM Deploy\test_deployments\resources\private-dns-zone\private-dns-zone.parameters.json" -Verbose

#AH-MPN

Select-AzSubscription -Subscription aa4f27b9-9a05-44e0-a90f-98bdaafc92a9

New-AzResourceGroupDeployment -ResourceGroupName rg-ukw-JosuedaSilva -TemplateFile "C:\Users\josue.dasilva\OneDrive - Cognizant LZ1\DevOps\ARM Deploy\test_deployments\resources\private-dns-zone\private-dns-zone.json" -TemplateParameterFile "C:\Users\josue.dasilva\OneDrive - Cognizant LZ1\DevOps\ARM Deploy\test_deployments\resources\private-dns-zone\private-dns-zone.parameters.json" -Verbose











