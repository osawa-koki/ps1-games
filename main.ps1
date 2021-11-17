param(
  [Parameter()]
  $game = $null
)

if ($null -eq $game) {
  Write-Host ""
  Write-Host "`tPut the game name in the fst parameter."
  Write-Host "`t  You can select the game from the list below."
  Write-Host "`t  - add-nums -> Add 4 numbers quickly and correctly."
  Write-Host "`t  - just10 -> Measure JUST 10 seconds."
  Write-Host ""
  Exit -1
}

switch ($game) {
  version {
    Clear-Host
    Write-Host ""
    Write-Host "`t*** ********* ***" -ForegroundColor Magenta
    Write-Host "`t*** ps1-games ***" -ForegroundColor Magenta
    Write-Host "`t*** ********* ***" -ForegroundColor Magenta
    Write-Host ""
    Write-Host "`t`tversion: 1.0.0" -ForegroundColor Green
    Write-Host ""
    Exit 0
  }
}
