function Get-AzClassicStorageAccount {
    [CmdletBinding(DefaultParameterSetName = 'StorageAccountName')]
    param (
        [Parameter(ParameterSetName = 'StorageAccountName')]
        $StorageAccountName,

        $ResourceGroupName = 'Default-Storage-NorthEurope',

        [Parameter(ParameterSetName = 'Pattern')]
        $Pattern
    )

    $getAzResourceSplat = @{
        ResourceType      = 'Microsoft.ClassicStorage/storageAccounts'
        ApiVersion        = '2020-10-01' 
        ResourceGroupName = $ResourceGroupName
    }
    if ($pscmdlet.ParameterSetName -eq 'StorageAccountName') {
        Get-AzResource @getAzResourceSplat |
        Where-Object Name -EQ $StorageAccountName
    }
    elseif ($pscmdlet.ParameterSetName -eq 'Pattern') {
        Get-AzResource @getAzResourceSplat |
        Where-Object Name -Match $Pattern
    }
}