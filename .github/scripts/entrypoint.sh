#!/bin/bash

echo "Starting vowel frequency analysis..."

# Change to workspace directory
cd /workspace

# Run the Python script and capture output
echo "Analyzing data.txt..."
FREQ_RESULT=$(python .github/scripts/frequency.py data.txt)

if [ $? -eq 0 ]; then
    echo "Analysis completed successfully!"
    echo "Results: $FREQ_RESULT"
    
    # Update README with results
    echo "Updating README.md..."
    bash .github/scripts/update_readme.sh "$FREQ_RESULT" "$GITHUB_USER"
    
    echo "Process completed successfully!"
else
    echo "Error: Analysis failed!"
    exit 1
fi