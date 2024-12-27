files=$(git diff --name-only origin/main HEAD)
echo "Modified files:"
if [ -n "$files" ]; then
  echo "$files"
  echo ""
  lines=$(echo "$files" | xargs -r grep -r '// MERGE:') # if this line ends up in the comment it's because the action was edited
  echo "Modified lines:"
  if [ -n "$lines" ]; then
    echo "$lines"
    echo ""
    comments=$(echo "$lines" | sed 's/^/- [ ] `/' | sed 's/:\/\/ MERGE:/`:/')
    echo "comments=$comments"
  else
    echo "None"
    echo "comments=None"
  fi
else
  echo "None"
  echo "comments=None"
fi