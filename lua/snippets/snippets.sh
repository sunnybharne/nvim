#! /bin/bash

# This script performs the following tasks:
# 1. Deletes all .lua files in the current directory and its subdirectories.
# 2. For each subdirectory, creates a new .lua file named after the subdirectory.
# 3. Writes LuaSnip snippet definitions to the new .lua file based on the contents of non-.lua files in the subdirectory.
# 4. Ensures that existing .lua files in each subdirectory have consistent formatting.

# Find all .lua files and delete them
find . -type f -name "*.lua" -exec rm -f {} +

# Print a message after deletion
echo "All .lua files have been deleted."

# Get a list of all subdirectories
folders=($(ls -d */))

# Iterate over each subdirectory
for folder in "${folders[@]}"; do
    output_file="${folder%/}.lua"  # Remove trailing slash and add .lua extension
    echo "Creating $output_file in $folder"
    
    # Write the LuaSnip variable declarations at the top of the new .lua file
    {
        echo "local ls = require('luasnip')"
        echo "local s = ls.snippet"
        echo "local t = ls.text_node"
        echo "local i = ls.insert_node"
        echo ""
    } > "$folder$output_file"

    # Iterate over each file in the subdirectory
    for file in "$folder"*; do
        if [ -f "$file" ] && [[ "$file" != *.lua ]]; then
            echo "#######################"
            echo $file

            # Extract the base name of the file without extension
            output_string=$(echo "$file" | sed -e 's|.*/||' -e 's|\..*||')

            echo "$output_string"

            # Write the snippet definition start to the new .lua file
            {
                echo "ls.add_snippets('all', {"
                echo "  s(\"$output_string\","
                echo "    t({"
            } >> "$folder$output_file"

            # Read the contents of the file and write each line as a text node in the snippet
            while IFS= read -r line || [[ -n "$line" ]]; do
                if [ -z "$line" ]; then
                    echo '"",' >> "$folder$output_file"
                else
                    echo "\"$line\"," >> "$folder$output_file"
                fi
            done < "$file"
            
            # Write the snippet definition end to the new .lua file
            {
                echo "    }))"
                echo "})"
                echo ""
            } >> "$folder$output_file"
        fi
    done

    # Check and update existing .lua files in the subdirectory
    for lua_file in "$folder"*.lua; do
        if [ -f "$lua_file" ]; then
            temp_file=$(mktemp)
            while IFS= read -r line || [[ -n "$line" ]]; do
                if [ "$line" = '""' ]; then
                    echo '"",' >> "$temp_file"
                else
                    echo "$line" >> "$temp_file"
                fi
            done < "$lua_file"
            mv "$temp_file" "$lua_file"
        fi
    done
done
