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

//particle stuff
p_system = part_system_create();
p_emitter_p = part_emitter_create(p_system);
p_emitter_m = part_emitter_create(p_system);
p_dice = part_type_create();
part_system_automatic_draw(p_system, false);
part_emitter_region(p_system, p_emitter_p, 240, 240, 260, 260, ps_shape_ellipse, ps_distr_gaussian);
part_emitter_region(p_system, p_emitter_m, 720, 720, 250, 250, ps_shape_ellipse, ps_distr_gaussian);
part_type_life(p_dice, 30, 90);
part_type_alpha2(p_dice, 1, 0);
part_type_sprite(p_dice, sprDice, false, false, true);
part_type_size(p_dice, 0.5, 0.5, 0, 0);
part_type_direction(p_dice, 45, 135, 0, 0);
part_type_orientation(p_dice, 0, 360, 10, 0, true);
part_type_speed(p_dice, 3, 6, -0.05, 0);
part_type_gravity(p_dice, 0.15, 270);