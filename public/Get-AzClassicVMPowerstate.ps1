function Get-AzClassicVMPowerstate {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,
            ValueFromPipelineByPropertyName)]
        [string]
        $Name,

        [Parameter(Mandatory,
            ValueFromPipelineByPropertyName)]
        [string]
        $ResourceGroupName
    )

    $vmStatus = Get-AzResource -ResourceType 'Microsoft.ClassicCompute/VirtualMachines' -Name $Name -ResourceGroupName $ResourceGroupName |
    Select-Object * -ExpandProperty Properties |
    Select-Object * -ExpandProperty InstanceView

    $vmStatus | Select-Object Name, powerState, ResourceGroupName
}
