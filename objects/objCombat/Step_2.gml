if(global.game_state == "combat")
	{
	//animate player/monster
	switch(combat_state)
		{
		case -1:
			{
			}
		case 0:
			{
			++timer;
			p_x = 240 + (sin(timer / 20) * 5);
			p_y = 260 + (cos(timer / 30) * 10);
			m_x = 720 + (sin((timer + 20) / 20) * 5);
			m_y = 260 + (cos((timer + 20) / 30) * 10);
			}
		case 1:
		case 2:
		case 3:
		case 4:
		default:
			{break;}
		}
	}

if(keyboard_check_pressed(vk_f2))
	{active_monster = ds_list_find_value(monsters,irandom(ds_list_size(monsters)-1));}