#!/bin/bash

# Define paths
downloads_folder="$HOME"
desktop_folder="$HOME"
ankita_folder="$desktop_folder/Ankita"
source_file="$downloads_folder/sample.txt"
destination_file="$ankita_folder/sample_d.txt"
processed_file="$ankita_folder/processed_sample.txt"
log_file="$desktop_folder/script_execution_log_$(date +'%Y%m%d_%H%M%S').log"

# Function to log messages
log_message() {
    echo "$(date +'%Y-%m-%d %H:%M:%S') - $1" >> "$log_file"
}

# 1. Move the file from Downloads to the Ankita folder on the Desktop.
if [ -f "$source_file" ]; then
    mv "$source_file" "$destination_file"
    log_message "Moved sample.txt from Downloads to Ankita folder on Desktop."
else
    log_message "Error: sample.txt not found in Downloads."
    exit 1
fi

# 2. Rename sample.txt to sample_d.txt (already handled in the move step)

# 3. Add header "SAMPLE FILE" to sample_d.txt
echo "SAMPLE FILE" | cat - "$destination_file" > temp && mv temp "$destination_file"
log_message "Added header to sample_d.txt."

# 4. Remove the 3rd column from sample_d.txt
awk -F',' '{ $3=""; print $0 }' "$destination_file" | sed 's/,,/,/g' > temp && mv temp "$destination_file"
log_message "Removed the 3rd column from sample_d.txt."

# 5. Change the delimiter to | globally
sed -i 's/,/|/g' "$destination_file"
log_message "Changed delimiter to | in sample_d.txt."

# 6. Rename the file to processed_sample.txt
mv "$destination_file" "$processed_file"
log_message "Renamed sample_d.txt to processed_sample.txt."

# 7. (Already placed in Ankita folder as processed_sample.txt)

# Write log file with timestamp
log_message "Script execution completed successfully."

echo "Script completed. Log file created at $log_file."

