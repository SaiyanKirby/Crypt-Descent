/// @description test

if(keyboard_check_pressed(ord("C")))
	{
	if(global.game_state == "explore")
		{
		global.game_state = "combat";
		objCombat.combat_state = -1;
		objCombat.timer = 0;
		objCombat.p_x = -60;
		objCombat.m_x = global.window_width + 60;
		with(objPlayer)
			{
			if(global.current_player == playerNumber)
				{objCombat.active_player = self;}
			}
		audio_stop_sound(global.music);
		global.music = audio_play_sound(sndFight,100,true);
		}
	else
		{
		global.game_state = "explore";
		audio_stop_sound(global.music);
		global.music = audio_play_sound(sndExplore,100,true);
		}
	}