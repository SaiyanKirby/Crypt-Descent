image_speed = 0;

shadow = instance_create_depth(x,y,depth+1,objPlayerShadow);

playerNumber = 1;

cursorTimer = 0;

playerMovement = 0;
hasMoved = false;
isMoving = false;
moveTimer = 0;
moveTime = 12;
x_prev = x;
y_prev = y;
x_next = x;
y_next = y;

buffered_input = "";
frames_since_buffer = 0;
max_buffer_time = 30;

//stats
playerClass = 0;
playerMaxHP = 20;
playerHP = 20;
playerLevel = 1;
playerEXP = 0;
playerSpeed = 4;
canGoThroughWalls = false;
playerDice = ds_grid_create(7,11);
//7 wide for d4, 6, 8, 10, 12, 20, and modifier
//11 tall for str, dex, int, fire, water, earth, air, lightning, poison, dark, holy
playerEquipment = ds_list_create();
playerInventory = ds_list_create();
playerPotions = ds_list_create();
playerSpells = ds_list_create();
playerPet = -1;