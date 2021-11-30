Clear-Host
Write-Host '==================== QUINA ===================' -ForegroundColor Green
Write-Host ''
Write-Host ''
Start-Sleep -Seconds 2
[int]$numeros = Read-Host 'Digite a quantidade de números da aposta (5 até 10)'
[int]$jogos = Read-Host "Digite a quantidade de jogos (1 até 10)"
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