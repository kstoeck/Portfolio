/// @description Insert description here
// You can write your code in this editor
if (one_click) {
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

	// 2) Parse the THIRD row (lines[2]) and increment the values
	if (array_length(lines) > 2) { // Ensure at least 3 rows exist
	    var columns = string_split(lines[5], ","); // Split the third row
		var column2 = string_split(lines[8], ",");
		
	    // Safety check: make sure we have at least 2 columns
	    if (array_length(columns) >= 2) {
	        var val1 = real(columns[0]); // first value
	        var val2 = real(columns[1]); // second value
			var val3 = real(column2[0]);
			var val4 = real(column2[1]);

	        // Debug: Display the current values before incrementing
	        show_debug_message("Before Increment - val1: " + string(val1) + ", val2: " + string(val2));

			var cost = power(2, val2 + 1);
			if (val3 >= cost) {
				// Perform the purchase
				val3 -= cost;    // Subtract the cost from val3
				val1 -= 20;    // Increment val1 (update as needed)
				val2 += 1;       // Increment val2 for the next level
			}
			if (val2 == 8) {
				image_index = 2;
			}

	        // Update the third row in the lines array
	        lines[5] = string(val1) + "," + string(val2);
			lines[8] = string(val3) + "," + string(val4);

	        // Debug: Display the updated values
	        show_debug_message("After Increment - val1: " + string(val1) + ", val2: " + string(val2));
	    }
	} else {
	    show_debug_message("File does not contain enough rows to update the third row!");
	    exit; // Stop execution if there are not enough rows
	}

	// 3) Write all lines back to ship_data.txt
	file = file_text_open_write(file_path);
	if (file < 0) {
	    show_debug_message("Couldn't open ship_data.txt for writing!");
	    exit;
	}

	for (var i = 0; i < array_length(lines); i++) {
	    file_text_write_string(file, lines[i]);
	    file_text_writeln(file);
	}

	file_text_close(file);

	// Confirmation message
	show_debug_message("Third row updated successfully!");
	
	one_click = false;
	alarm[0] = 15;
}