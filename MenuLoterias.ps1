﻿function Invoke-Menu{
    Import-Module GeoHomeTools
    Set-ConsoleFont "Lucida Console" -Size 20
    Start-Sleep -Seconds 2
    Resize-Console -Maximize
    Clear-Host
  
    $host.UI.RawUI.WindowTitle = "Geo Loterias v. 0.0.1"

   $title = "Geo Loterias"

   $menuwidth = (Get-ConsoleSize).Width
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

Write-Verbose "Construindo o Cabeçalho."
$dataAtual = (Get-Date).ToString()
for ($i=0;$i -lt $menuwidth;$i++){
    Write-Host "=" -NoNewline
}

Write-Host ($title.PadLeft($pad) + $dataAtual.PadLeft(50)) -ForegroundColor Yellow
for ($i=0;$i -lt $menuwidth;$i++){
    Write-Host "=" -NoNewline
}



Write-Verbose "Construindo o Menu de opçoes ."
Write-Host ""
Write-Host $menu -ForegroundColor Yellow
[int]$r=Read-Host "Selecione uma opcao do menu"

if((1..5) -notcontains $r){
    Write-Warning "$r nao e uma opcao valida"
    pause
    Invoke-Menu
}

Write-Verbose "Selecionando a opção"
switch ($r) {
    1 { Start-Process powershell -ArgumentList ("-ExecutionPolicy ByPass " + $showWindowMegaSena) -Wait }
    2 {Start-Process powershell -ArgumentList ("-ExecutionPolicy ByPass " + $showWindowLotofacil) -Wait}
    3{Start-Process powershell -ArgumentList ("-ExecutionPolicy ByPass " + $showWindowQuina) -Wait}
    5 {
        Clear-Host
        Write-Host "Obrigado" -ForegroundColor Green
        Return
    }
}
}

$showWindowMegaSena = {
    Import-Module GeoHomeTools
    Set-ConsoleFont -Name 'Lucida Console' -Size 20
    Start-Sleep -Seconds 1
    Set-WindowPosition -X 200 -Y 200 -Width 600 -Height 400
    Start-Sleep -Seconds 1 | Out-Null
    Resize-Console -Width 80 -Height 20
    Start-Sleep -Seconds 1
    Clear-Host
    Write-Host '=================================== MegaSena ===================================' -ForegroundColor Green
    Write-Host ''
    Write-Host ''
    [int]$numeros = Read-Host "Digite a quantidade de números da aposta `(6 até 10`)"
    [int]$jogos = Read-Host "Digite a quantidade de jogos `(1 até 10`)"
    Write-Host ''
    Write-Host ''

    if($jogos -gt 1){
        Write-Host 'Apostas Geradas :'
    } Else {
        Write-Host 'Aposta Gerada :'
    }

    for ($i = 0;$i -lt $jogos;$i++){
       
        $aposta = Get-ApostaMegaSena -numero $numeros |Select-Object -ExpandProperty Aposta
        Write-Host $aposta -NoNewline
        Write-Host
    }  
    Write-Host ''
    Write-Host ''
    Pause
}

$showWindowLotofacil = {
    Clear-Host
    Write-Host '==================== Lotofácil ===================' -ForegroundColor Green
    Write-Host ''
    Write-Host ''
    [int]$numeros = Read-Host 'Digite a quantidade de números da aposta (15 até 20)'
    [int]$jogos = Read-Host "Digite a quantidade de jogos (1 até 10)"
    Write-Host ''
    Write-Host ''

    if($jogos -gt 1){
        Write-Host 'Apostas Geradas :'
    } Else {
        Write-Host 'Aposta Gerada :'
    }

    for ($i = 0;$i -lt $jogos;$i++){
       
        $aposta = Get-ApostaLotofacil -numero $numeros |Select-Object -ExpandProperty Aposta
        Write-Host $aposta -NoNewline
        Write-Host
    }  
    Write-Host ''
    Write-Host ''
    Pause

}

$showWindowQuina = {
    Clear-Host
Write-Host '==================== QUINA ===================' -ForegroundColor Green
Write-Host ''
Write-Host ''
Start-Sleep -Seconds 2
[int]$numeros = Read-Host "Digite a quantidade de números da aposta 5 até 10"
[int]$jogos = Read-Host "Digite a quantidade de jogos 1 até 10"
Write-Host ''
Write-Host ''

if($jogos -gt 1){
    Write-Host 'Apostas Geradas :'
} Else {
    Write-Host 'Aposta Gerada :'
}

for ($i = 0;$i -lt $jogos;$i++){
   
    $aposta = Get-ApostaQuina -numero $numeros |Select-Object -ExpandProperty Aposta
    Write-Host $aposta -NoNewline
    Write-Host
}  
Write-Host ''
Write-Host ''
Pause
}

Invoke-Menu

