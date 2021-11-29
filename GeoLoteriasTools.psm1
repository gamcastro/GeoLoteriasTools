function Get-ApostaMegaSena{
<#
.SYNOPSIS
Ferramenta para gerar aposta da loteria megasena
.DESCRIPTION
Ferramenta para gerar aposta da loteria megasena. A aposta poderá ter no mínimo 6 números e no máximo 10
.PARAMETER numeros
Quantidade de números que aposta conterá 
.EXAMPLE
Get-ApostaMegaSena
Gera uma aposta padrao com 6 numeros

.EXAMPLE
Get-ApostaMegaSena -numeros 10
Gera uma aposta com 10 numeros

#>
[cmdletBinding()]
param(
    [ValidateRange(6,10)]
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

function Get-ApostaLotofacil{
    <#
    .SYNOPSIS
    Ferramenta para gerar aposta da loteria lotofácil
    .DESCRIPTION
    Ferramenta para gerar apostas da loteria lotofácil.A(s) aposta(s) deverá conter no mímimo 15 e no máximo 20 números
    .PARAMETER numeros
    Quantidade de números que a aposta conterá

    .EXAMPLE
    Get-ApostaLotofacil
    Gera uma aposta padrao da lotofacil com 15 números

    .EXAMPLE
    Get-ApostaLotofacil -numeros 20
    Gera uma aposta da lotofacil com 20 números

    #>
    [Cmdletbinding()]
    Param(
        [ValidateRange(15,20)]
        [int]$numeros=15
    )
    BEGIN{
        $s = 0
        [int[]] $conjunto = @()
    }
    PROCESS{
        while ($conjunto.Count -lt $numeros)
    {
        for ($i=0;$i -lt ($numeros -$s);$i++)
        {
            $conjunto += Get-Random -Minimum 1 -Maximum 25
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