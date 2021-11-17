
$message = Read-Host "message -> "

$date = $(Get-Date).AddYears(-1)
try {
  git add .
  git commit --allow-empty -m "$message" --date="$date"
  git rebase HEAD~1 --committer-date-is-author-date
  git push -u origin
} catch {
  Write-Host "Error: $($_.Exception.Message)" -ForegroundColor Red
}
