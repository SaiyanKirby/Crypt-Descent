if(global.game_state == "combat")
	{
	//animate player/monster
	++song_timer;
	//bpm is 155
	//(360 * (bpm/60) * 0.1) = 93
	if(song_timer >= 93) {song_timer = 0;}
	var cycle = degtorad(song_timer * bpm * 0.1);
	//the bounces try to sync with the song
	var p_x_waggle = cos(cycle / 2) * 10;
	var p_y_waggle = cos(cycle) * 5;
	var m_x_waggle = cos(cycle / 2) * -10;
	var m_y_waggle = cos(cycle) * 5;
	
	switch(combat_state)
		{
		case -1:
			#region starting state
			{
			++timer;
			if(timer < 30)
				{
				p_x = lerp(p_x, 240, 0.2);
				p_y = 260;
				m_x = lerp(m_x, 720, 0.2);
				m_y = 260;
				}
			else// if(timer < 90)
				{
				p_x = 240 + random((timer / 30) * 5);
				p_y = 260 + random((timer / 30) * 5);
				m_x = 720 + random((timer / 30) * 5);
				m_y = 260 + random((timer / 30) * 5);
				}
			if(!audio_exists(global.music))
				{
				//audio_stop_sound(global.music);
				global.music = audio_play_sound(sndFightLoop,100,true);
				timer = 0;
				song_timer = 0;
				combat_state = 0;
				}
			break;
			}
			#endregion
		case 0:
			#region idle state
			{
			p_x = 240 + p_x_waggle;
			p_y = 260 + p_y_waggle;
			m_x = 720 + m_x_waggle;
			m_y = 260 + m_y_waggle;
			
			if(global.pressedA)
				{
				timer = 0;
				combat_state = 1;
				};
			break;
			}
			#endregion
		case 1:
			#region player attacks
			{
			++timer
			if(timer == 1)
				{
				p_x = 300;
				part_emitter_burst(p_system, p_emitter_m, p_dice, irandom_range(10,20));
				}
			if(timer < 60)
				{
				p_x = lerp(p_x, 240 + p_x_waggle, 0.1);
				p_y = 260 + p_y_waggle;
				m_x = 720 + m_x_waggle + random(((60-timer) / 60) * 30);
				m_y = 260 + m_y_waggle + random(((60-timer) / 60) * 30);
				}
			else if(timer < 90)
				{
				p_x = 240 + p_x_waggle;
				p_y = 260 + p_y_waggle;
				m_x = 720 + m_x_waggle;
				m_y = 260 + m_y_waggle;
				}
			else
				{
				timer = 0;
				combat_state = 2;
				}
			break;
			}
			#endregion
		case 2:
			#region monster attacks
			{
			++timer
			if(timer == 1)
				{
				m_x = 660;
				part_emitter_burst(p_system, p_emitter_p, p_dice, irandom_range(10,20));
				}
			if(timer < 60)
				{
				p_x = 240 + p_x_waggle + random(((60-timer) / 60) * 30);
				p_y = 260 + p_y_waggle + random(((60-timer) / 60) * 30);
				m_x = lerp(m_x, 720 + m_x_waggle, 0.1);
				m_y = 260 + m_y_waggle;
				}
			else if(timer < 90)
				{
				p_x = 240 + p_x_waggle;
				p_y = 260 + p_y_waggle;
				m_x = 720 + m_x_waggle;
				m_y = 260 + m_y_waggle;
				}
			else
				{
				timer = 0;
				combat_state = 3;//!!temporary!!
				}
			break;
			}
			#endregion
		case 3:
			#region player wins
			{
			global.game_state = "explore";
			audio_stop_sound(global.music);
			global.music = audio_play_sound(sndExplore,100,true);
			++global.current_player;
			if(global.current_player > global.max_players)
				{global.current_player = 1;}
			with(objPlayer)
				{
				if(global.current_player == playerNumber)
					{objCamera.follow = self}
				turn_start_x = x;
				turn_start_y = y;
				}
			break;
			}
			#endregion
		case 4:
		default:
			{break;}
		}
	}

if(keyboard_check_pressed(vk_f2))
	{
	active_monster = ds_list_find_value(monsters,irandom(ds_list_size(monsters)-1));
	ds_grid_clear(monster_dice,0);
	monster_dice[# irandom(6), irandom(2)] = 1;
	monster_dice[# irandom(6), irandom_range(3, 10)] = choose(1,2);
	}