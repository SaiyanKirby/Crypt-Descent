if(global.game_state == "combat")
	{
	draw_set_alpha(0.75);
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
	draw_sprite(sprDiceUI,0,150,360);
	}