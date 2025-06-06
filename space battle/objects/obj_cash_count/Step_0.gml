/// @description Insert description here
// You can write your code in this editor
var file_path = working_directory + "ship_data.txt";

// 1) Read all lines from ship_data.txt into an array (or list)
var file = file_text_open_read(file_path);
if (file < 0) {
    show_debug_message("Could not open ship_data.txt!");
    exit; // Or return, so we don't continue
}

var lines = [];

// Read every line into 'lines'
while (!file_text_eof(file)) {
    var line_str = file_text_read_string(file);
    file_text_readln(file);

    // Remove potential BOM & trim
    line_str = string_replace_all(line_str, chr(65279), "");
    line_str = string_trim(line_str);

    array_push(lines, line_str);
}

file_text_close(file);

// 2) Parse the FIRST line (lines[0]) and set image_index based on val2
if (array_length(lines) > 0) {
    var columns = string_split(lines[8], ","); // e.g. ["0.05", "0"]

    val = columns[0];
    
}