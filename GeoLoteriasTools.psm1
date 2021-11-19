function Get-ApostaMegaSena{
<#
.SYNOPSIS
Ferramenta para gerar aposta da loteria megasena
.DESCRIPTION
Ferramenta para gerar aposta da loteria megasena. A aposta poderá ter no mínimo 6 números e no máximo 10
.PARAMETER numeros
Quantidade de números que aposta conterá 
.EXAMPLE
Gera uma aposta padrao com 6 numeros
Get-ApostaMegaSena

02 04 08 12 34 56 60

.EXAMPLE
Gera uma aposta com 10 numeros
Get-ApostaMegaSena -numeros 10

01 08 09 12 15 20 24 29 34 55

#>
[cmdletBinding()]
param(
    [int]$numeros=6
)
BEGIN{}
PROCESS{
    $s = 0
   [int[]] $conjunto = @()
    while ($conjunto.Count -lt $numeros)
    {
        for ($i=0;$i -lt ($numeros -$s);$i++)
        {
            $conjunto += Get-Random -Minimum 1 -Maximum 60
        }
        $conjunto = $conjunto | Sort-Object | Get-Unique
        $s = $conjunto.Count
       
    }
    $guid = New-Guid
    $props = @{'Aposta' = $conjunto
               'Identificador' = $guid.Guid
                'Data' = Get-Date}
    $obj = New-Object -TypeName psobject -Property $props
    Write-Output $obj
}
END{}
}