function Get-AzClassicStorageAccountKey {
    [CmdletBinding(DefaultParameterSetName = 'Context')]
    param (
        [Parameter(Mandatory,
            ParameterSetName = 'subscriptionId')]
        $SubscriptionId,

        [string]
        $ResourceGroupName = 'Default-Storage-NorthEurope',

        [Parameter(Mandatory)]
        $StorageAccountName,

        [Parameter(ParameterSetName = 'Context')]
        [Microsoft.Azure.Commands.Profile.Models.Core.PSAzureContext]
        $Context = (Get-AzContext)
    )
        
    if ($PSCmdlet.ParameterSetName -eq 'Context') {
        $SubscriptionId = $Context.Subscription
    }
    $InvokeAzResourceActionSplat = @{
        ResourceId = '/subscriptions/{0}/resourceGroups/{1}/providers/Microsoft.ClassicStorage/storageAccounts/{2}' -f (
            $SubscriptionId,
            $ResourceGroupName,
            $StorageAccountName
        )
        Action     = 'listkeys'
        ApiVersion = '2016-11-01'
        Force      = $true
    }
    Invoke-AzResourceAction @InvokeAzResourceActionSplat
}