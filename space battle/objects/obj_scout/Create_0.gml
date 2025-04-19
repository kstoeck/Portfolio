/// @description Insert description here
// You can write your code in this editor
var file_path = working_directory + "ship_data.txt";

// 1) Read all lines from ship_data.txt into an array (or list)
var file = file_text_open_read(file_path);
if (file < 0) {
    show_debug_message("Could not open ship_data.txt!");
    exit; // Exit if the file cannot be opened
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

// 2) Parse the lines and assign variables based on the data
if (array_length(lines) >= 8) { // Ensure there are enough lines to parse
    var data_array = [];

    // Populate data_array, skipping the fourth line (lines[3])
    for (var i = 0; i < array_length(lines); i++) {
        if (i == 3) continue; // Skip the fourth line

        var columns = string_split(lines[i], ",");
        if (array_length(columns) > 0 && columns[0] != "") {
            array_push(data_array, real(columns[0]));
        }
    }

    // Assign variables from data_array
    speed_value  = data_array[0];
    damage_value = data_array[1];
    shield_value = data_array[2];
    max_shield   = shield_value;  
    regen_lag    = data_array[3];
    regen_rate   = data_array[4];
    regen        = data_array[5];
    reload       = data_array[6]; // 60 from the last line
} else {
    show_debug_message("Insufficient data in ship_data.txt!");
    exit; // Exit if there are not enough lines
}

// Initialize other variables
_bullet_number = 0;
_player = 1;
heal = true;
alarm[1] = reload;


