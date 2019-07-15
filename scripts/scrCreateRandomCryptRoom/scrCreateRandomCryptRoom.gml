var design = [choose(spaces.ground),
choose(spaces.ground,spaces.wall),
choose(spaces.ground,spaces.wall),
spaces.ground,
choose(spaces.ground,spaces.wall)];

if(irandom_range(1,4) == 1)
	{design[irandom(4)] = spaces.potion;}

//rotate towards previous room

if(design[1] == spaces.wall)
	{design[1] = spaces.topwall;};
if(design[2] == spaces.wall)
	{design[2] = spaces.rightwall;};
if(design[3] == spaces.wall)
	{design[3] = spaces.bottomwall;};
if(design[4] == spaces.wall)
	{design[4] = spaces.leftwall;};

return design;