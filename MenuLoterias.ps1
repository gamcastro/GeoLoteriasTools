function Invoke-Menu{
    [cmdletbinding()]
    Param()

    Clear-Host

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
    1 {  }
    2 {}
    3{}
    5 {
        Clear-Host
        Write-Host "Obrigado" -ForegroundColor Green
        Return
    }
}
}
Invoke-Menu

