
$message = Read-Host "message -> "

$date = $(Get-Date).AddYears(-1)
git add .
git commit -m "$message" --date="$date"
git rebase HEAD~1 --committer-date-is-author-date
