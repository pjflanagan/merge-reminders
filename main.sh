echo "Modified files:"
files=$(git diff --name-only $INPUT_BASE_SHA $INPUT_HEAD_SHA)

if [ -n "$files" ]; then
  echo "$files"
  echo ""

  echo "Modified lines:"
  lines=$(echo "$files" | xargs -r grep -r "[\/\/|#] $INPUT_FLAG" || echo "")

  if [ -n "$lines" ]; then
    echo "$lines"
    echo ""

    echo "Formatting comments:"
    comments=$(echo "$lines" | sed "s/:.*[\/\/|#] $INPUT_FLAG/\`/" | sed 's/^/- [ ] `/' )
    echo "$comments"
    echo ""

    echo 'comments<<EOF' >> $GITHUB_OUTPUT
    echo "$comments" >> $GITHUB_OUTPUT
    echo 'EOF' >> $GITHUB_OUTPUT

  else
    echo "None"
    echo "comments=None" >> "$GITHUB_OUTPUT"
  fi

else
  echo "None"
  echo "comments=None" >> "$GITHUB_OUTPUT"
fi