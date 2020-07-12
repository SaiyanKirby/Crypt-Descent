var design = [spaces.groundnormal,
choose(spaces.groundnormal,spaces.wall),
choose(spaces.groundnormal,spaces.wall),
spaces.groundnormal,
choose(spaces.groundnormal,spaces.wall)];

repeat(5)
	{
	if(irandom_range(1,5) == 1)
		{
		design[irandom(4)] = choose(spaces.event,
									spaces.potion,
									spaces.chest,);
		}
	}

//rotate towards previous room

if(design[1] == spaces.wall)
	{design[1] = spaces.topwallnormal;};
if(design[2] == spaces.wall)
	{design[2] = spaces.rightwallnormal;};
if(design[3] == spaces.wall)
	{design[3] = spaces.bottomwallnormal;};
if(design[4] == spaces.wall)
	{design[4] = spaces.leftwallnormal;};

return design;