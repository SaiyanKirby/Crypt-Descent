/// @description Insert description here
// You can write your code in this editor

draw_set_halign(fa_left);
draw_text(8,8,"Press F1 to regenerate the dungeon.\n"+
"Press WASD or arrow keys to move outside of combat.\n"+
"Press Numpad +/- to zoom in/out.\n"+
"Press Space to attack in combat.");
draw_set_halign(fa_center);
draw_text_transformed(480,520,string(global.rooms_created) + " / " + string(global.crypt_room_number) + " rooms",2,2,0);
draw_set_halign(fa_left);