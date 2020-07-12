if(!instance_exists(active_player))
	{exit;};

if(global.game_state == "combat")
	{
	var fade_to_black = 0.9;
	if(combat_state == -1 && timer <= 30)
		{fade_to_black = (timer/30) * 0.9}
	draw_set_alpha(fade_to_black);
	draw_set_color(c_black);
	draw_rectangle(0,0,global.window_width,global.window_height,false);
	draw_set_color(c_white);
	draw_set_alpha(1);
	
	//draw player/enemy
	draw_sprite_ext(sprPlayer,active_player.playerClass,p_x,p_y,p_xscale,p_yscale,p_angle,c_white,1);
	draw_sprite_ext(active_monster[1],0,m_x,m_y,m_xscale,m_yscale,m_angle,c_white,1);
	
	draw_set_halign(fa_center);
	draw_text_transformed(240,300,"Player " + string(global.current_player),2,2,0);
	draw_text_transformed(720,300,active_monster[0],2,2,0);
	
	switch(combat_state)
		{
		case -1:
			#region starting state
			{
			break;
			}; #endregion
		case 0:
		case 1:
		case 2:
			#region idle state, attacking states
			{
			//draw dice numbers
			if(!show_all_dice)
				{}
			else
				{
				//draw entire dice grid
				//--player--
				draw_sprite(sprDiceUI,0,150,360);
				var xx = 0;
				var yy = 0;
				var d = 0;
				for(xx = 0; xx < 8; xx++)
					{
					for(yy = 0; yy < 11; yy++)
						{
						d = active_player.playerDice[# xx, yy];
						if(d != 0)
							{
							if(xx == 7)
								{draw_text(188 + (xx * 18), 382 + (yy * 13), string(d));}
							else	
								{draw_text(185 + (xx * 18), 382 + (yy * 13), string(d));}
							}
						}
					}
				//--monster--
				draw_sprite(sprDiceUI,0,635,360);
				var xx = 0;
				var yy = 0;
				var d = 0;
				for(xx = 0; xx < 8; xx++)
					{
					for(yy = 0; yy < 11; yy++)
						{
						d = monster_dice[# xx, yy];
						if(d != 0)
							{
							if(xx == 7)
								{draw_text(673 + (xx * 18), 382 + (yy * 13), string(d));}
							else	
								{draw_text(670 + (xx * 18), 382 + (yy * 13), string(d));}
							}
						}
					}
				}
			//break;
			
			}; #endregion
		#region commented out
			/*
		case 1:
			#region player attacks
			{
			break;
			}; #endregion
		case 2:
			#region monster attacks
			{
			break;
			}; #endregion
			*/
		#endregion
		case 3:
			#region end state (player wins)
			{
			break;
			}; #endregion
		case 4:
			#region end state (player dies)
			{
			break;
			}; #endregion
		}
	part_system_drawit(p_system);
	}