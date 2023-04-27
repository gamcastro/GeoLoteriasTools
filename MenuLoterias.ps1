
<#PSScriptInfo

.VERSION 0.0.1

.GUID bde81e27-5114-40f0-a3a7-604eff72ae1b

.AUTHOR George Castro

.COMPANYNAME 

.COPYRIGHT 

.TAGS 

.LICENSEURI 

.PROJECTURI 

.ICONURI 

.EXTERNALMODULEDEPENDENCIES 

.REQUIREDSCRIPTS 

.EXTERNALSCRIPTDEPENDENCIES 

.RELEASENOTES

.DESCRIPTION 
 Menu de opcoes do GeoLoterias 

#>


function Invoke-Menu{
    Import-Module GeoHomeTools
    Set-ConsoleFont "Lucida Console" -Size 20
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
    1 { Start-Process pwsh -Wait -ArgumentList ("-ExecutionPolicy ByPass -Command" + $showWindowMegaSena)  }
    L {Start-Process pwsh -Wait -ArgumentList ("-ExecutionPolicy ByPass -Command" + $showWindowLotofacil) }
    3{Start-Process pwsh  -Wait -ArgumentList ("-ExecutionPolicy ByPass -Command" + $showWindowQuina) }
    5 {
        Clear-Host
        Write-Host "Obrigado" -ForegroundColor Green
        Return
    }
}
}

$showWindowMegaSena = {
    Import-Module GeoHomeTools
    Import-Module WindowsConsoleFonts

    Set-ConsoleFont -Name 'Lucida Console' -Size 20   

    Set-WindowPosition -X 500 -Y 100 -Width 600 -Height 400 | Out-Null  
    $host.UI.RawUI.WindowTitle = 'MegaSena'
    
    Resize-Console -Width 70 -Height 25
    
    Clear-Host
    Write-Host '============================== MegaSena =============================' -ForegroundColor Green
    Write-Host ''
    Write-Host ''
    
        [int]$numeros = Read-Host "Digite a quantidade de números da aposta `(6 até 10`)"
        [int]$jogos = Read-Host "Digite a quantidade de jogos `(1 até 10`)"
    
        if (((6..10) -notcontains $numeros) -or (1..10) -notcontains $jogos){
            Write-Host 'Opcao invalida'
            Pause
            Return
        }
    
    Write-Host ''
    Write-Host ''

    if($jogos -gt 1){
        Write-Host 'Apostas Geradas :'
    } Else {
        Write-Host 'Aposta Gerada :'
    }
    Write-Host ''
    for ($i = 0;$i -lt $jogos;$i++){
       
        $aposta = Get-ApostaMegaSena -numero $numeros |Select-Object -Property Aposta
        Write-Host "Aposta ($i + 1) : `t" -NoNewline
        foreach ($item in $aposta.Aposta) {           
            [string]$formatedItem = '{0:D2}' -f $item
            Write-Host "$formatedItem ' ' "  -NoNewline
        }
       Write-Host ''
    }  
    Write-Host ''
    Write-Host ''
    Pause
}.GetNewClosure()

$showWindowLotofacil = {
    Import-Module GeoHomeTools

    Set-ConsoleFont -Name 'Lucida Console' -Size 20   

    Set-WindowPosition -X 500 -Y 100 -Width 400 -Height 300 | Out-Null  
    $host.UI.RawUI.WindowTitle = 'LotoFacil'
    
    Resize-Console -Width 70 -Height 25
    
    Clear-Host
    Write-Host '============================= LotoFacil =============================' -ForegroundColor Green
    Write-Host ''
    Write-Host ''
    [int]$numeros = Read-Host "Digite a quantidade de números da aposta `(15 até 20`)"
    [int]$jogos = Read-Host "Digite a quantidade de jogos `(1 até 10`)"
    Write-Host ''
    Write-Host ''

    if($jogos -gt 1){
        Write-Host 'Apostas Geradas :'
    } Else {
        Write-Host 'Aposta Gerada :'
    }
    Write-Host ''
    for ($i = 0;$i -lt $jogos;$i++){
       
        $aposta = Get-ApostaLotofacil -numero $numeros |Select-Object -Property Aposta
        Write-Host "Aposta ($i + 1):' '" -NoNewline
        foreach ($item in $aposta.Aposta) {           
            [string]$formatedItem = '{0:D2}' -f $item
            Write-Host "$formatedItem ' ' "   -NoNewline
        }
       Write-Host ''
    }  
    Write-Host ''
    Write-Host ''
    Pause

}.GetNewClosure()

$showWindowQuina = {
    Import-Module GeoHomeTools

    Set-ConsoleFont -Name 'Lucida Console' -Size 20   

    Set-WindowPosition -X 200 -Y 200 -Width 600 -Height 400 | Out-Null  
    $host.UI.RawUI.WindowTitle = 'Quina'
    
    Resize-Console -Width 80 -Height 20
    
    Clear-Host
    Write-Host '================================== Quina ==================================' -ForegroundColor Green
    Write-Host ''
    Write-Host ''
    [int]$numeros = Read-Host "Digite a quantidade de números da aposta `(5 até 10`)"
    [int]$jogos = Read-Host "Digite a quantidade de jogos `(1 até 10`)"
    Write-Host ''
    Write-Host ''

    if($jogos -gt 1){
        Write-Host 'Apostas Geradas :'
    } Else {
        Write-Host 'Aposta Gerada :'
    }
    Write-Host ''
    for ($i = 0;$i -lt $jogos;$i++){
       
        $aposta = Get-ApostaQuina -numero $numeros |Select-Object -Property Aposta
        Write-Host "Aposta ($i + 1) : `t" -NoNewline
        foreach ($item in $aposta.Aposta) {           
            [string]$formatedItem = '{0:D2}' -f $item
            Write-Host "$formatedItem ' ' "   -NoNewline
        }
       Write-Host ''
    }  
    Write-Host ''
    Write-Host ''
    Pause
}.GetNewClosure()

Invoke-Menu


