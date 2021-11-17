param(
  [Parameter()]
  $game = $null
)

if ($null -eq $game) {
  Clear-Host
  Write-Host ""
  Write-Host "welcome@ps1-games~: $"
  Write-Host ""
  Write-Host "`t@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@" -ForegroundColor Magenta
  Write-Host "`t@                                                @" -ForegroundColor Magenta
  Write-Host "`t@            Welcome to ps1-games !!!            @" -ForegroundColor Magenta
  Write-Host "`t@                                                @" -ForegroundColor Magenta
  Write-Host "`t@       - you can play games                     @" -ForegroundColor Magenta
  Write-Host "`t@           pretending working.                  @" -ForegroundColor Magenta
  Write-Host "`t@       - even if your boss appear,              @" -ForegroundColor Magenta
  Write-Host "`t@           don't worry keep playing.            @" -ForegroundColor Magenta
  Write-Host "`t@       - your look just programming.            @" -ForegroundColor Magenta
  Write-Host "`t@       > type '.\main.ps1 help' for more detail @" -ForegroundColor Magenta
  Write-Host "`t@                                                @" -ForegroundColor Magenta
  Write-Host "`t@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@" -ForegroundColor Magenta
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
  help {
    Write-Host ""
    Write-Host "`tPut the game name in the fst parameter."
    Write-Host "`t  You can select the game from the list below."
    Write-Host "`t  - add-nums -> Add 4 numbers quickly and correctly."
    Write-Host "`t  - just10 -> Measure JUST 10 seconds."
    Write-Host ""
    Write-Host "`tex) .\main.ps1 add-nums"
    Write-Host "`tex) .\main.ps1 just10"
    Write-Host "`tex) .\main.ps1 help"
    Write-Host "`tex) .\main.ps1 version"
    Write-Host ""
    Write-Host "`t  or you can use the following commands."
    Write-Host "`t  - help -> Show this help."
    Write-Host "`t  - version -> Show the version."
    Write-Host "`tex) .\main.ps1 help"
    Write-Host "`tex) .\main.ps1 version"
    Write-Host ""
  }
}
