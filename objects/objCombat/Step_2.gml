if(global.game_state == "combat")
	{
	//animate player/monster
	var p_x_waggle = sin(current_time / 200) * 5;
	var p_y_waggle = sin(current_time / 250) * 5;
	var m_x_waggle = sin((current_time + 500) / 200) * 5;
	var m_y_waggle = sin((current_time + 500) / 250) * 5;
	
	switch(combat_state)
		{
		case -1:
			#region starting state
			{
			++timer;
			if(timer < 20)
				{
				p_x = lerp(p_x, 240, 0.2);
				p_y = 260;
				m_x = lerp(m_x, 720, 0.2);
				m_y = 260;
				}
			else if(timer < 90)
				{
				p_x = 240 + random((timer / 30) * 5);
				p_y = 260 + random((timer / 30) * 5);
				m_x = 720 + random((timer / 30) * 5);
				m_y = 260 + random((timer / 30) * 5);
				}
			else
				{
				timer = 0;
				combat_state = 0;
				};
			break;
			}
			#endregion
		case 0:
			#region idle state
			{
			++timer;
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
				combat_state = 0;
				}
			break;
			}
			#endregion
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