/// @description Insert description here
// You can write your code in this editor
// Call the default Draw event if the object has a sprite
draw_self();

// Set the font to your custom font
draw_set_font(fnt_large);

// Optionally, set a text color
draw_set_color(c_white);

// Draw the value of 'val' on the screen with the custom font
draw_text(x, y, string(val));

// Reset the font and color to defaults (optional, but good practice)
draw_set_font(-1); // Default font
draw_set_color(c_white); // Default color