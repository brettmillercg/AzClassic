function Set-AzClassicVM {
    [CmdletBinding(SupportsShouldProcess,
        ConfirmImpact = 'Medium')]
    param (
        [Parameter(Mandatory)]
        [Alias('ResourceName')]
        [string]
        $Name,

        [Parameter(Mandatory)]
        [string]
        $ResourceGroupName,

        [parameter(Mandatory)]
        [ValidateSet('Stop', 'Start')]
        [string]$Action,

        [string]
        $ApiVersion = '2017-04-01',

        [switch]
        $Force
    )

    if ($PSCmdlet.ShouldProcess("$Name", ("{0}ing virtual machine" -f $Action))) {
        $invokeResourceActionSplat = @{
            ResourceType      = 'Microsoft.ClassicCompute/virtualMachines'
            ResourceName      = $Name
            ResourceGroupName = $ResourceGroupName
            Action            = $Action
            ApiVersion        = $ApiVersion
        }

        if ($Force) {
            $invokeResourceActionSplat.Force = $true
        }

        Invoke-AzResourceAction @invokeResourceActionSplat
    }
}
