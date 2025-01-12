#!/bin/zsh

# Maximum URL length (set limit)
MAX_URL_LENGTH=1900
# Maximum folder or file name length for macOS
MAX_NAME_LENGTH=255

# Base directory for the output
BASE_DIR="./web_accessible_resources"

# Input lyrics (one line per folder)
read -r -d '' LYRICS << EOL
We're no strangers to love
You know the rules and so do I
A full commitment's what I'm thinkin' of
You wouldn't get this from any other guy
I just wanna tell you how I'm feeling
Gotta make you understand
Never gonna give you up
Never gonna let you down
Never gonna run around and desert you
Never gonna make you cry
Never gonna say goodbye
Never gonna tell a lie and hurt you
We've known each other for so long
Your heart's been aching, but you're too shy to say it
Inside, we both know what's been going on
We know the game and we're gonna play it
And if you ask me how I'm feeling
Don't tell me you're too blind to see
Never gonna give you up
Never gonna let you down
Never gonna run around and desert you
Never gonna make you cry
Never gonna say goodbye
Never gonna tell a lie and hurt you
Never gonna give you up
Never gonna let you down
Never gonna run around and desert you
Never gonna make you cry
Never gonna say goodbye
Never gonna tell a lie and hurt you
EOL

# Prepare base directory
rm -rf "$BASE_DIR" # Clean up if it already exists
mkdir -p "$BASE_DIR"

# Initialize variables
current_path="$BASE_DIR"
total_length=${#BASE_DIR}

# Function to split a long folder name into smaller chunks
split_long_name() {
    local name=$1
    local max_length=$2
    local chunks=()

    while [[ ${#name} -gt $max_length ]]; do
        chunks+=("${name[1,$max_length]}")
        name="${name[$((max_length + 1)),-1]}"
    done
    chunks+=("$name")
    echo "${chunks[@]}"
}

# Process each line of lyrics
echo "$LYRICS" | while IFS= read -r line; do
    # Sanitize folder name (replace spaces with underscores and remove non-URL-safe characters)
    sanitized_line=$(echo "$line" | tr ' ' '_' | tr -dc '[:alnum:]_-')

    # Split the line if it exceeds the maximum name length
    chunks=($(split_long_name "$sanitized_line" "$MAX_NAME_LENGTH"))

    for chunk in "${chunks[@]}"; do
        # Calculate the new path length
        new_path="${current_path}/${chunk}"
        new_length=${#new_path}

        # Check if adding this folder exceeds the max URL length
        if (( new_length > MAX_URL_LENGTH )); then
            echo "Reached URL length limit of $MAX_URL_LENGTH characters. Stopping at line: \"$line\""
            break 2
        fi

        # Create the folder and update the current path
        mkdir -p "$new_path"
        current_path="$new_path"
    done
done

# Add a dummy file at the end of the folder chain
touch "$current_path/rickroll.txt"

# Output results
echo "Folder structure created successfully under $BASE_DIR."
echo "Final path length: ${#current_path}"
