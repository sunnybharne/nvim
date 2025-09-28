#!/bin/bash

# Script to convert all LuaSnip snippets to the new format
# This script converts t({"line1","line2"}) patterns to t({"line1","line2"})

echo "Converting all snippet files to new format..."

# Function to convert a single file
convert_file() {
    local file="$1"
    echo "Converting: $file"
    
    # Create backup
    cp "$file" "$file.backup"
    
    # Use sed to convert the format
    # This is a simplified conversion - you may need to adjust based on your specific patterns
    sed -i.tmp '
    # Convert t({"line",""}) patterns to single t() with array
    s/t({"\([^"]*\)",""})/t({\n      "\1"\n    })/g
    ' "$file"
    
    # Clean up temp file
    rm -f "$file.tmp"
}

# List of snippet directories
SNIPPET_DIRS=(
    "lua/snippets/bicep"
    "lua/snippets/terraform" 
    "lua/snippets/typescript"
    "lua/snippets/docker"
    "lua/snippets/github-actions"
    "lua/snippets/pester"
    "lua/snippets/azure"
)

# Convert all .lua files in snippet directories
for dir in "${SNIPPET_DIRS[@]}"; do
    if [ -d "$dir" ]; then
        echo "Processing directory: $dir"
        find "$dir" -name "*.lua" -type f | while read -r file; do
            convert_file "$file"
        done
    fi
done

echo "Conversion complete!"
echo "Backup files created with .backup extension"
echo "Review the changes and remove .backup files when satisfied"
