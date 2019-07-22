if(global.game_state == "combat")
	{
	//animate player/monster
	switch(combat_state)
		{
		case -1:
			{
			++timer;
			if(timer < 20)
				{
				p_x = lerp(-60, 240, (timer / 20));
				p_y = 260;
				m_x = lerp(1120, 720, (timer / 20));
				m_y = 260;
				}
			else
				{
				timer = 0;
				combat_state = 0;
				};
			break;
			}
		case 0:
			{
			++timer;
			p_x = 240 + (sin(timer / 20) * 5);
			p_y = 260 + (sin(timer / 30) * 5);
			m_x = 720 + (sin((timer + 45) / 20) * 5);
			m_y = 260 + (sin((timer + 45) / 30) * 5);
			break;
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
	{
	active_monster = ds_list_find_value(monsters,irandom(ds_list_size(monsters)-1));
	ds_grid_clear(monster_dice,0);
	monster_dice[# irandom(6), irandom(2)] = 1;
	monster_dice[# irandom(6), irandom_range(3, 10)] = choose(1,2);
	}