param(
  [Parameter()]
  [ParameterType]$game = $null
)

if ($null -eq $game) {
  Clear-Host
  Write-Host ""
  Write-Host "`tPut the game name in the fst parameter."
  Write-Host "`t  You can select the game from the list below."
  Write-Host "`t  - add-nums -> Add 4 numbers quickly and correctly."
  Write-Host "`t  - just10 -> Measure JUST 10 seconds."
  Write-Host ""
}
