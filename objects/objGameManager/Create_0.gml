global.current_player = 1;
global.max_players = 4;

global.game_state = "explore";
//states: explore, menu, combat, event

global.fontTiny = font_add_sprite(sprFontTiny,33,true,0);
draw_set_font(global.fontTiny);