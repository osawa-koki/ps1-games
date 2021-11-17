param(
  [string]$message
)
$date = $(Get-Date).AddYears(-1)
git add .
git commit -m "$message" --date="$date"
git rebase HEAD~0 --committer-date-is-author-date