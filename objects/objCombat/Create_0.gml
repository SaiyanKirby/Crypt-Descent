// variables for displaying the player/monster sprites in combat
timer = 0;
//player sprite to animate in combat
p_x = 0;
p_y = 0;
p_xscale = 4;
p_yscale = 4;
p_angle = 0;
//monster sprite to animate in combat
m_x = 0;
m_y = 0;
m_xscale = 4;
m_yscale = 4;
m_angle = 0;

combat_state = -1;
/*
states:
-1: starting
0: idle
1: player attacks
2: monster attacks
3: end (player wins)
4: end (player dies)
*/
show_all_dice = true;
//if false, calculate expected damage and show that

monsters = ds_list_create();// list of all monster types
ds_list_add(monsters,["Skeleman",sprSkeleton]);
ds_list_add(monsters,["Impling",sprImp]);
ds_list_add(monsters,["Big Chungus",sprOrc]);

active_player = instance_find(objPlayer,1);
active_monster = ds_list_find_value(monsters,irandom(ds_list_size(monsters)-1));
monster_dice = ds_grid_create(8,11);
monster_dice[# irandom(6), irandom(2)] = 1;
monster_dice[# irandom(6), irandom_range(3, 10)] = choose(1,2);