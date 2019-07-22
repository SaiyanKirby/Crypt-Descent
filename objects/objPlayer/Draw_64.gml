if(global.game_state == "explore" && global.current_player == playerNumber)
	{
	draw_set_halign(fa_center);
	draw_text_transformed(480,460,string(playerMovement) + " / " + string(playerSpeed) + " movement",2,2,0);
	draw_set_halign(fa_left);
	}