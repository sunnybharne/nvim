#! /bin/bash

# Find all .lua files and delete them
find . -type f -name "*.lua" -exec rm -f {} +

# Print a message after deletion
echo "All .lua files have been deleted."

folders=($(ls -d */))

for folder in "${folders[@]}"; do
    output_file="${folder%/}.lua"  # Remove trailing slash and add .lua extension
    echo "Creating $output_file in $folder"
    
    # Write the variables at the very top of the file
    {
        echo "local ls = require('luasnip')"
        echo "local s = ls.snippet"
        echo "local t = ls.text_node"
        echo "local i = ls.insert_node"
        echo ""
    } > "$folder$output_file"

    for file in "$folder"*; do
        if [ -f "$file" ] && [[ "$file" != *.lua ]]; then
          echo "#######################"
          echo $file

          output_string=$(echo "$file" | sed -e 's|.*/||' -e 's|\..*||')

          echo "$output_string"

            # Write the starting lines to the output file
            {
                echo "ls.add_snippets('all', {"
                echo "  s(\"$output_string\","
                echo "    t({"
            } >> "$folder$output_file"

            while IFS= read -r line || [[ -n "$line" ]]; do
                if [ -z "$line" ]; then
                    echo '"",' >> "$folder$output_file"
                else
                    echo "\"$line\"," >> "$folder$output_file"
                fi
            done < "$file"
            
            # Write the ending lines to the output file
            {
              echo "    }))"
                echo "})"
                echo ""
            } >> "$folder$output_file"
        fi
    done

    # Check and update existing .lua files in the folder
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

