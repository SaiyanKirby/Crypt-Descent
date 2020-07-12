global.current_player = 1;
global.max_players = 4;

global.game_state = "explore";
//states: explore, menu, combat, event
global.game_substate = ds_list_create();
//its a list to handle stacking states, such as nested menus

global.fontTiny = font_add_sprite(sprFontTiny,33,true,0);
draw_set_font(global.fontTiny);

volume_music = 0.25;
volume_sfx = 0.25;

audio_sound_gain(sndExplore, volume_music, 0);
audio_sound_gain(sndFightIntro, volume_music, 0);
audio_sound_gain(sndFightLoop, volume_music, 0);

global.music = audio_play_sound(sndExplore,100,true);