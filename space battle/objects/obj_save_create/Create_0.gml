/// @description Insert description here
// You can write your code in this editor
// The path where we want to keep the file for reading/writing
var file_path = working_directory + "ship_data.txt";

// If it doesn't exist yet, copy it from included files
if (!file_exists(file_path)) {
    // copy the included file to the working directory
    var buffer = buffer_create(file_size("ship_data.txt"), buffer_fixed, 1);
    var f1 = file_bin_open("ship_data.txt", 0); // open included file (read)
    file_bin_read(f1, buffer, buffer_get_size(buffer));
    file_bin_close(f1);

    var f2 = file_bin_open(file_path, 2); // open new file (write)
    file_bin_write(f2, buffer, buffer_get_size(buffer));
    file_bin_close(f2);

    buffer_delete(buffer);
}