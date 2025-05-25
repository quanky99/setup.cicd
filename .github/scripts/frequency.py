import sys
from collections import Counter

def count_vowels(file_path):
    """Count vowels in the given file."""
    try:
        with open(file_path, 'r', encoding='utf-8') as file:
            text = file.read().lower()
            vowels = 'aeiou'
            vowel_count = Counter(char for char in text if char in vowels)
            return vowel_count
    except FileNotFoundError:
        print(f"Error: File '{file_path}' not found.")
        sys.exit(1)
    except Exception as e:
        print(f"Error reading file: {e}")
        sys.exit(1)

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python frequency.py <file_path>")
        sys.exit(1)
    
    file_path = sys.argv[1]
    result = count_vowels(file_path)
    
    # Print results in a formatted way
    for vowel in 'aeiou':
        print(f"{vowel}: {result.get(vowel, 0)}")