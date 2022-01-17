function Start-AzClassicVM {
    [CmdletBinding(SupportsShouldProcess,
        ConfirmImpact = 'Medium')]
    param (
        [Parameter(Mandatory)]
        [string]
        $Name,

        [Parameter(Mandatory)]
        [string]
        $ResourceGroupName
    )

    if ($PSCmdlet.ShouldProcess("$Name", "Starting virtual machine")) {
        Invoke-AzResourceAction -ResourceType Microsoft.ClassicCompute/virtualMachines -ResourceName $Name -Action 'start' -ApiVersion '2017-04-01' -ResourceGroupName $ResourceGroupName
    }
}
