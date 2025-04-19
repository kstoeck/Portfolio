/// @description Insert description here
// You can write your code in this editor

if (clock_running) {
    frame_count++;
    if (frame_count mod room_speed == 0) {
        seconds++;
        if (seconds >= 60) {
            seconds = 0;
            minutes++;
            if (minutes >= 60) {
                minutes = 0;
                hours++;
            }
        }
    }
}