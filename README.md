# ps1-games

PowerShellで動作する簡単なゲーム。  

## add-nums

出力された4つの数字の和をできるだけ早く、できるだけ正確に計算します。  

![add-nums](./docs/img/add-nums.gif)  

## just10

10秒ぴったりでタイマーを止めます。  

![just10](./docs/img/just10.gif)  

## blackjack

ブラックジャックです。  

![blackjack](./docs/img/blackjack.gif)  

## 遊び方

```shell
./game.ps add-nums
./game.ps just10 
./game.ps blackjack 
```

## Powershellのバージョン

エスケープシーケンスによる文字の装飾を行っているため、6.0以上が要求される。[^1]

[^1]: https://learn.microsoft.com/ja-jp/powershell/scripting/dev-cross-plat/vscode/using-vscode?view=powershell-7.3&viewFallbackFrom=powershell-7.1#choosing-a-version-of-powershell-to-use-with-the-extension

```shell
# バージョンを確認
$PSVersionTable
```

最新のインストールするためには以下のコマンドを実行。  
インストーラがダウンロードされ、自動で実行される。  

```shell
Invoke-Expression "& { $(Invoke-RestMethod https://aka.ms/install-powershell.ps1) } -UseMSI"
```

<!--
## Gitコミット

```shell
git init
git rebase --root --committer-date-is-author-date

git log --pretty=fuller
```

```shell
$message = Read-Host "message -> "

$date = $(Get-Date).AddYears(-1)
try {
  git add .
  git commit --allow-empty -m "$message" --date="$date"
  git rebase HEAD~1 --committer-date-is-author-date
  # git push -u origin
} catch {
  Write-Host "Error: $($_.Exception.Message)" -ForegroundColor Red
}
```
-->
