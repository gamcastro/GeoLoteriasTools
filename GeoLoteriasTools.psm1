function Get-ApostaMegaSena{
<#
.SYNOPSIS
Gera aposta automática da loteria megasena.

.DESCRIPTION
O comando `Get-ApostaMegaSenha´ gera aposta automática da loteria megasena.
A aposta poderá ter no mínimo 6 números e no máximo 10.

.PARAMETER numero
Quantidade de números que a aposta conterá .

.EXAMPLE
Get-ApostaMegaSena
Gera uma aposta padrao com 6 numeros.

.EXAMPLE
Get-ApostaMegaSena -numero 10
Gera uma aposta com 10 numeros.

#>
[cmdletBinding()]
param(
    [ValidateRange(6,10)]
    [int]$numero=6
)
BEGIN{}
PROCESS{
    $s = 0
   [int[]] $conjunto = @()
    while ($conjunto.Count -lt $numero)
    {
        for ($i=0;$i -lt ($numero -$s);$i++)
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
    Gera aposta automática da loteria Lotofácil.

    .DESCRIPTION
    O comando `Get-ApostaLotofacil´ gera aposta da loteria lotofácil
    .A aposta deverá conter no mímimo 15 e no máximo 20 números.

    .PARAMETER numero
    Quantidade de números que a aposta conterá

    .EXAMPLE
    Get-ApostaLotofacil
    Gera uma aposta padrao da lotofacil com 15 números.

    .EXAMPLE
    Get-ApostaLotofacil -numero 20
    Gera uma aposta da lotofacil com 20 números.

    #>
    [Cmdletbinding()]
    Param(
        [ValidateRange(15,20)]
        [int]$numero=15
    )
    BEGIN{
        $s = 0
        [int[]] $conjunto = @()
    }
    PROCESS{
        while ($conjunto.Count -lt $numero)
    {
        for ($i=0;$i -lt ($numero -$s);$i++)
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

function Get-ApostaQuina{
    <#
    .SYNOPSIS
    Gera aposta automática da loteria QUINA.

    .DESCRIPTION
    O comando ´Get-ApostaQuina` gera uma aposta automática da loteria QUINA.
    A aposta deverá conter no mínimo 5 e no máximo 10.

    .PARAMETER numero
    Quantidade de números que a aposta conterá.

    .EXAMPLE
    Get-ApostaQuina
    Gera uma aposta padrão da QUINA com 5 números.

    .EXAMPLE
    Get-ApostaQuina -numero 15
    Gera uma aposta da Quina com 15 números.
    #>
    [Cmdletbinding()]
    Param(
        [ValidateRange(5,15)]
        [int]$numero=5
    )
    BEGIN{
        $s = 0
        [int[]] $conjunto = @()
    }
    PROCESS{
        while ($conjunto.Count -lt $numero)
    {
        for ($i=0;$i -lt ($numero -$s);$i++)
        {
            $conjunto += Get-Random -Minimum 1 -Maximum 80
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