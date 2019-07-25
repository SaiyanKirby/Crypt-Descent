/// @description Insert description here
// You can write your code in this editor

draw_set_halign(fa_left);
draw_text(8,8,"Press space to regenerate the dungeon.\
Press WASD or arrow keys to move outside of combat.\
Press numpad +/- to zoom in/out.\
Press C to enter/exit combat.\
Press space to attack in combat.");
draw_set_halign(fa_center);
draw_text_transformed(480,500,string(global.rooms_created) + " / " + string(global.crypt_room_number) + " rooms",2,2,0);
draw_set_halign(fa_left);