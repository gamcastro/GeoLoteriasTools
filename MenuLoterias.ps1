function Invoke-Menu{
    
    Clear-Host
    $host.UI.RawUI.WindowTitle = "GEO LOTERIAS"

   $title = "Geo Loterias"

   $menuwidth = 30
   [int]$pad = ($menuwidth/2)+($title.length/2)
   $menu = @"

   Opções
------------------------------
1. MegaSena
2. Lotofacil
3. Quina
5. Sair

selecione uma opcao do menu

"@

Write-Host ($title.PadLeft($pad)) -ForegroundColor Cyan
Write-Host $menu -ForegroundColor Yellow

[int]$r=Read-Host "Selecione uma opcao do menu"

if((1..5) -notcontains $r){
    Write-Warning "$r nao e uma opcao valida"
    pause
    Invoke-Menu
}

switch ($r) {
    1 { Invoke-SubMenuMegaSena }
    2 {}
    3{}
    5 {
        Clear-Host
        Write-Host "Obrigado" -ForegroundColor Green
        Return
    }
}
}

function Invoke-SubMenuMegaSena {
    Clear-Host
    Write-Host '==================== MegaSena ===================' -ForegroundColor Green
    Write-Host ''
    Write-Host ''
    [int]$numeros = Read-Host 'Digite a quantidade de números da aposta (6 até 10)'
    [int]$jogos = Read-Host "Digite a quantidade de jogos (1 até 10)"
    Write-Host ''
    Write-Host ''

    if($jogos -gt 1){
        Write-Host 'Apostas Geradas :'
    } Else {
        Write-Host 'Aposta Gerada :'
    }

    for ($i = 0;$i -lt $jogos;$i++){
       
        $aposta = Get-ApostaMegaSena -numeros $numeros |Select-Object -ExpandProperty Aposta
        Write-Host $aposta -NoNewline
        Write-Host
    }  
    Write-Host ''
    Write-Host ''
    Pause

}
Invoke-Menu

