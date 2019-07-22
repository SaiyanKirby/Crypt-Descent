/// @description test

if(keyboard_check_pressed(190))
	{
	if(global.game_state == "explore")
		{
		global.game_state = "combat";
		objCombat.combat_state = -1;
		objCombat.timer = 0;
		with(objPlayer)
			{
			if(global.current_player == playerNumber)
				{objCombat.active_player = self;}
			}
		}
	else
		{global.game_state = "explore";}
	}