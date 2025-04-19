/// @description Insert description here
// You can write your code in this editor
var file_path = working_directory + "ship_data.txt";
var file = file_text_open_read(file_path); // Instead of "ship_data.csv"
if (file < 0) {
    show_debug_message("Could not open ship_data.txt!");
} else {
    show_debug_message("File opened successfully!");
}

// We will store each "first column" value in an array for convenience
var data_array = array_create(7, 0); 
// Assuming we expect 7 lines total, matching the 7 variables we want to fill

// Read lines in a loop
var i = 0;
while (!file_text_eof(file) && i < 7) {
    var line_str = file_text_read_string(file);
    file_text_readln(file);

    // Remove potential BOM character & trim
    line_str = string_replace_all(line_str, chr(65279), ""); 
    line_str = string_trim(line_str);

    show_debug_message("Line: [" + line_str + "]");

    if (string_length(line_str) == 0) {
        // It's an empty line, skip it
        continue;
    }

    var columns = string_split(line_str, ",");
    if (array_length(columns) > 0 && columns[0] != "") {
        data_array[i] = real(columns[0]);
        i++;
    }
}

// Close the file now that we have our data
file_text_close(file);

bul_spd = data_array[3]; 
bul_dmg = data_array[1]; 

traveled_distance = 0;
max_distance = 1000;
speed = bul_spd;
direction = obj_scout.image_angle;

