function Get-AzClassicVM {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,
            Position = 0)]
        [string]
        $Name,

        [Parameter(Mandatory,
            Position = 1)]
        [string]
        $ResourceGroupName,

        [Parameter()]
        [switch]
        $ExpandProperties 
    )

    $getAzResourceSplat = @{
        ResourceType      = 'Microsoft.ClassicCompute/virtualMachines'
        Name              = $Name
        ResourceGroupName = $ResourceGroupName
    }
    
    if ($ExpandProperties.IsPresent) {
        Get-AzResource @getAzResourceSplat |
            Select-Object * -ExpandProperty Properties |
                Select-Object * -ExpandProperty InstanceView -ExcludeProperty Properties, InstanceView
    } else {
        Get-AzResource @getAzResourceSplat
    }
}
