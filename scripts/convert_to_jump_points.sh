#!/bin/bash

# Script to convert all LuaSnip snippets to jump-point format
# Format: t({"line",""}) for each line to create jump points

echo "Converting all snippet files to jump-point format..."

# Function to convert a single file
convert_file() {
    local file="$1"
    echo "Converting: $file"
    
    # Create backup
    cp "$file" "$file.backup"
    
    # This is a complex conversion that needs to be done carefully
    # We'll use a Python script for more precise conversion
    python3 << 'EOF'
import sys
import re

def convert_snippet_file(filepath):
    with open(filepath, 'r') as f:
        content = f.read()
    
    # Pattern to match t({["line1","line2","line3"]}) format
    def convert_array_to_jump_points(match):
        array_content = match.group(1)
        # Split by lines and convert each to t({"line",""})
        lines = array_content.split('","')
        result_lines = []
        for line in lines:
            line = line.strip().strip('"').strip("'")
            if line:  # Skip empty lines
                result_lines.append(f't({{"{line}",""}})')
        return ',\n    '.join(result_lines)
    
    # Convert t({["line1","line2","line3"]}) to multiple t({"line",""}) calls
    pattern = r't\(\{\s*\[([^\]]+)\]\s*\}\)'
    converted = re.sub(pattern, convert_array_to_jump_points, content, flags=re.MULTILINE | re.DOTALL)
    
    with open(filepath, 'w') as f:
        f.write(converted)

if __name__ == "__main__":
    convert_file(sys.argv[1])
EOF
}

# List of snippet files to convert
SNIPPET_FILES=(
    "lua/snippets/bicep/basic.lua"
    "lua/snippets/bicep/azure-resources.lua"
    "lua/snippets/bicep/bicep.lua"
    "lua/snippets/bicep/management.lua"
    "lua/snippets/terraform/terraform.lua"
    "lua/snippets/terraform/azure-resources.lua"
    "lua/snippets/terraform/aws-resources.lua"
    "lua/snippets/terraform/simple-resources.lua"
    "lua/snippets/terraform/variables.lua"
    "lua/snippets/terraform/patterns.lua"
    "lua/snippets/terraform/provider.lua"
    "lua/snippets/terraform/settings.lua"
    "lua/snippets/terraform/mg.lua"
    "lua/snippets/typescript/cdktf.lua"
    "lua/snippets/typescript/cdktf-aws.lua"
    "lua/snippets/typescript/cdktf-basic.lua"
    "lua/snippets/docker/basic.lua"
    "lua/snippets/docker/compose.lua"
    "lua/snippets/docker/ubuntu.lua"
    "lua/snippets/github-actions/basic.lua"
    "lua/snippets/pester/describe.lua"
    "lua/snippets/pester/it.lua"
    "lua/snippets/pester/boilerplate.lua"
    "lua/snippets/pester/beforeall.lua"
    "lua/snippets/pester/afterall.lua"
    "lua/snippets/azure/ado.lua"
)

# Convert all files
for file in "${SNIPPET_FILES[@]}"; do
    if [ -f "$file" ]; then
        convert_file "$file"
    else
        echo "File not found: $file"
    fi
done

echo "Conversion complete!"
echo "Backup files created with .backup extension"
echo "Review the changes and remove .backup files when satisfied"
