
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