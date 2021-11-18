param(
  [Parameter()]
  $game = $null
)

class blackjack_class {
  blackjack_class() {
    foreach ($number_object in $this.number_objects) {
      foreach ($mark in $this.marks) {
        $this.cards_left += @{
          mark = $mark
          number_object = $number_object
        }
      }
    }
    $this.cards_left = Get-Random -InputObject $this.cards_left -Count $this.cards_left.Count
  }

  [int] $player_points = 0
  [int] $dealer_points = 0
  $player_cards = @()
  $dealer_cards = @()
  $cards_left = @()

  [Boolean] $player_stopped = $false
  [Boolean] $dealer_stopped = $false

  $number_objects = @(@{num=1;name="A"},@{num=2;name="2"},@{num=3;name="3"},@{num=4;name="4"},@{num=5;name="5"},@{num=6;name="6"},@{num=7;name="7"},@{num=8;name="8"},@{num=9;name="9"},@{num=10;name="10"},@{num=10;name="J"},@{num=10;name="Q"},@{num=10;name="K"})
  $marks = @("♠", "♥", "♦", "♣")

  ShowStatus([Boolean]$completed = $false) {
    Clear-Host
    Write-Host ""
    Write-Host " ===== current status ===== " -ForegroundColor Magenta
    Write-Host " *                        *" -ForegroundColor Magenta
    if ($completed) {
      Write-Host "  your points: $(([string]$this.player_points).PadLeft(2))" -ForegroundColor Red -NoNewline
      Write-Host " | " -NoNewline
      foreach ($card in $($this.player_cards)) {
        Write-Host " $($card.number_object.name.PadLeft(2)) $($card.mark)" -ForegroundColor Red -NoNewline
      }
      Write-Host ""
      Write-Host "dealer points: $(([string]$this.dealer_points).PadLeft(2))" -ForegroundColor Blue -NoNewline
      Write-Host " | " -NoNewline
      foreach ($card in $($this.dealer_cards)) {
        Write-Host " $($card.number_object.name.PadLeft(2)) $($card.mark)" -ForegroundColor Blue -NoNewline
      }
    } else {
      Write-Host "  your points: $(([string]$this.player_points).PadLeft(2))" -ForegroundColor Red -NoNewline
      Write-Host " | " -NoNewline
      foreach ($card in $($this.player_cards)) {
        Write-Host " $($card.number_object.name.PadLeft(2)) $($card.mark)" -ForegroundColor Red -NoNewline
      }
      Write-Host ""
      Write-Host "dealer points: **" -ForegroundColor Blue -NoNewline
      Write-Host " | " -NoNewline
      foreach ($card in $($this.dealer_cards)) {
        Write-Host "  ---" -ForegroundColor Red -NoNewline
      }
    }
    Write-Host ""
    Write-Host " *                        *" -ForegroundColor Magenta
    Write-Host " ===== ============== ===== " -ForegroundColor Magenta
    Write-Host ""
    if ($completed) {
      if (21 -lt $this.player_points) {
        $this.player_points = 0
      }
      if (21 -lt $this.dealer_points) {
        $this.dealer_points = 0
      }
      $arrow_colors = @("Green", "Yellow", "Red", "Magenta", "Cyan", "Green", "Yellow", "Red", "Magenta", "Cyan")
      foreach ($arrow_color in $arrow_colors) {
        Write-Host "`b=>" -NoNewline -ForegroundColor $arrow_color
        Start-Sleep -Milliseconds 50
      }
      Write-Host " " -NoNewline
      if ($this.player_points -gt $this.dealer_points) {
        Write-Host "`e[1mYou won!`e[0m" -ForegroundColor Red
      } elseif ($this.player_points -lt $this.dealer_points) {
        Write-Host "`e[2mYou lost...`e[0m" -ForegroundColor Blue
      } else {
        Write-Host "Draw!" -ForegroundColor Green
      }
    }
    Write-Host ""
  }
  GetCard([int]$player) {
    $card = $this.cards_left[0]
    $this.cards_left = $this.cards_left[1..$($this.cards_left.Count - 1)]
    if ($player -eq 1) {
      $this.player_cards += $card
      $this.player_points += $card.number_object.num
    } else {
      $this.dealer_cards += $card
      $this.dealer_points += $card.number_object.num
    }
  }
}

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
    Write-Host "`tOr you can use the following commands."
    Write-Host "`t  - help -> Show this help."
    Write-Host "`t  - version -> Show the version."
    Write-Host "`tex) .\main.ps1 help"
    Write-Host "`tex) .\main.ps1 version"
    Write-Host ""
  }
  add-nums {
    $prev_is_correct = $null
    $total_timespan = 0
    $total = 0
    $correct = 0
    $question_count = 10
    for ($i = 1; $i -le $question_count; $i++) {
      Clear-Host
      Write-Host""
      if ($null -eq $prev_is_correct) {
        Write-Host "  Game Started!" -ForegroundColor Blue
      } elseif ($prev_is_correct) {
        Write-Host "  Is Correct !!!" -ForegroundColor Blue
      } else {
        Write-Host "  Is Incorrrect..." -ForegroundColor Red
      }
      Write-Host""
      Write-Host " Question: $i / $question_count" -ForegroundColor Magenta
      Write-Host ""
      Write-Host "`t`tyour total score is $($correct * 100 / $i)%." -ForegroundColor Green
      Write-Host "`t`tyour average speed is $($total_timespan / $i)." -ForegroundColor Green
      Write-Host ""
      $num1 = Get-Random -Minimum 1 -Maximum 10
      $num2 = Get-Random -Minimum 1 -Maximum 10
      $num3 = Get-Random -Minimum 1 -Maximum 10
      $num4 = Get-Random -Minimum 1 -Maximum 10
      $answer = $num1 + $num2 + $num3 + $num4
      $start = Get-Date
      $your_input = Read-Host "`t$num1 + $num2 + $num3 + $num4 = ???`n`n`t`t->"
      $end = Get-Date
      $timespan = $end - $start
      $total_timespan += $timespan.TotalSeconds
      $is_correct = $answer -eq $your_input
      if ($is_correct -eq $true) {
        $correct += 1
        $prev_is_correct = $true
      } else {
        $prev_is_correct = $false
      }
      $total += 1
    }
    Clear-Host
    $result_accuracy = $correct * 100 / $total
    $result_average_speed = $total_timespan / $total
    Write-Host ""
    Write-Host "  Game Finished!" -ForegroundColor Blue
    Write-Host ""
    Write-Host "  === Result ===================================" -ForegroundColor Magenta
    Write-Host "  =                                            =" -ForegroundColor Magenta

    Write-Host "  =    `e[31maccuracy`e[0m      : `e[32m$(([string]$result_accuracy).PadRight(3))%`e[35m                    =" -ForegroundColor Magenta
    Write-Host "  =    `e[31maverage speed`e[0m : `e[32m$(([string]$result_average_speed).PadRight(10))s`e[35m             =" -ForegroundColor Magenta
    Write-Host "  =                                            =" -ForegroundColor Magenta
    Write-Host "  ==============================================" -ForegroundColor Magenta
    Write-Host ""
  }
  just10 {
    Write-Host ""
    Write-Host " just 10" -ForegroundColor Magenta
    Write-Host ""
    Read-Host "`tPress Enter to start -> "
    Clear-Host
    $start = Get-Date
    while($true){
      Write-Host "." -NoNewline
      if([Console]::KeyAvailable){
        [Console]::ReadKey($true) > $null
        break
      }
      Start-Sleep -Milliseconds 10
    }
    $end = Get-Date
    $timespan = $end - $start
    $timespan = $timespan.TotalSeconds
    Clear-Host
    Write-Host ""
    Write-Host "  === Result ===================================" -ForegroundColor Magenta
    Write-Host "  =                                            =" -ForegroundColor Magenta
    Write-Host "  =    `e[31mtime`e[0m      : `e[32m$(([string]$timespan).PadRight(10))s`e[35m                 =" -ForegroundColor Magenta
    Write-Host "  =                                            =" -ForegroundColor Magenta
    Write-Host "  ==============================================" -ForegroundColor Magenta
    Write-Host ""
    Exit 0
  }
  blackjack {
    Clear-Host
    Write-Host ""
    Write-Host " blackjack" -ForegroundColor Magenta
    Write-Host ""
    Write-Host "`ttake card to get 21 or less."
    Read-Host "`tPress Enter to start -> "
    $blackjack_instance = [blackjack_class]::new()
    Clear-Host
    Write-Host "distributing 2 cards for each" -NoNewline
    for ($i = 0; $i -lt 10; $i++) {
      Write-Host "." -NoNewline
      Start-Sleep -Milliseconds 50
    }
    Clear-Host
    for ($i = 0; $i -lt 2; $i++) {
      $blackjack_instance.GetCard(1)
      $blackjack_instance.GetCard(2)
    }
    $blackjack_instance.ShowStatus($false)
    while (!($blackjack_instance.player_stopped) -And !($blackjack_instance.dealer_stopped)) {
      # 自分のターン
      if ($blackjack_instance.points_player -lt 21) {
        $your_input = Read-Host "`tTake card? (y/n) -> "
        if ($your_input -eq "y") {
          $blackjack_instance.GetCard(1)
          $blackjack_instance.ShowStatus($false)
        } else {
          $blackjack_instance.player_stopped = $true
        }
      } else {
        $blackjack_instance.player_stopped = $true
      }
      # ディーラーのターン
      if ($blackjack_instance.dealer_points -lt 17) {
        $blackjack_instance.GetCard(2)
        $blackjack_instance.ShowStatus($false)
      } else {
        $blackjack_instance.dealer_stopped = $true
      }
    }
    $blackjack_instance.ShowStatus($true)
    Exit 0
  }
  default {
    Write-Host ""
    Write-Host "`t| invalid parameter: `e[31m$game`e[32m |" -ForegroundColor Green
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
    Write-Host "`tOr you can use the following commands."
    Write-Host "`t  - help -> Show this help."
    Write-Host "`t  - version -> Show the version."
    Write-Host "`tex) .\main.ps1 help"
    Write-Host "`tex) .\main.ps1 version"
    Write-Host ""
  }
}
