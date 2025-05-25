#!/bin/bash

FREQ_RESULT="$1"
GITHUB_USER="$2"
TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S UTC')

# Configure Git
git config --global user.name "github-actions"
git config --global user.email "github-actions@users.noreply.github.com"

# Update README.md
echo -e "\n## Latest Vowel Frequency Analysis" >> README.md
echo -e "**Contributor:** $GITHUB_USER" >> README.md
echo -e "**Timestamp:** $TIMESTAMP" >> README.md
echo -e "**Results:**" >> README.md
echo -e "\`\`\`" >> README.md
echo "$FREQ_RESULT" >> README.md
echo -e "\`\`\`" >> README.md
echo -e "---" >> README.md
echo "Testing the vowel frequency analyzer with new content!" >> data.txt

# Commit and push changes
git add README.md
git commit -m "Update README with vowel frequency analysis by $GITHUB_USER"
git push