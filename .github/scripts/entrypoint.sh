#!/bin/bash

echo "Starting vowel frequency analysis..."

# Change to workspace directory
cd /workspace

# Check if data.txt exists
if [ ! -f data.txt ]; then
    echo "data.txt not found! Creating sample file..."
    echo "Hello World! This is a sample text file for vowel frequency analysis." > data.txt
    echo "It contains various vowels like a, e, i, o, u in different combinations." >> data.txt
    echo "The quick brown fox jumps over the lazy dog." >> data.txt
fi

# Run the Python script and capture output
echo "Analyzing data.txt..."
FREQ_RESULT=$(python .github/scripts/frequency.py data.txt 2>&1)

if [ $? -eq 0 ]; then
    echo "Analysis completed successfully!"
    echo "Results:"
    echo "$FREQ_RESULT"
    
    # Configure Git
    git config --global user.name "github-actions[bot]"
    git config --global user.email "41898282+github-actions[bot]@users.noreply.github.com"
    
    # Update README with results
    echo "Updating README.md..."
    
    # Create README.md if it doesn't exist
    if [ ! -f README.md ]; then
        echo "# Vowel Frequency Analyzer" > README.md
        echo "" >> README.md
        echo "This repository automatically analyzes vowel frequency in data.txt files." >> README.md
    fi
    
    # Add analysis results
    TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S UTC')
    echo "" >> README.md
    echo "## Latest Vowel Frequency Analysis" >> README.md
    echo "**Contributor:** $GITHUB_USER" >> README.md
    echo "**Timestamp:** $TIMESTAMP" >> README.md
    echo "**Results:**" >> README.md
    echo '```' >> README.md
    echo "$FREQ_RESULT" >> README.md
    echo '```' >> README.md
    echo "---" >> README.md
    
    # Commit and push changes
    git add README.md
    git add data.txt  # In case we created it
    
    if ! git diff --staged --quiet; then
        git commit -m "Update README with vowel frequency analysis by $GITHUB_USER"
        git push
        echo "README.md updated successfully!"
    else
        echo "No changes to commit."
    fi
    
    echo "Process completed successfully!"
else
    echo "Error: Analysis failed!"
    echo "Error output: $FREQ_RESULT"
    exit 1
fi