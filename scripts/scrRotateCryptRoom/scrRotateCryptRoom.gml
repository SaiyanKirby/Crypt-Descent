/// @function scrRotateCryptRoom(design, amount)
/// @description Rotate a given room design
/// @param {array} design The design of the room to rotate
/// @param {real} amount Rotate by 90, 180, or 270 degrees clockwise

var newdesign = 0;

switch(argument1)
	{
	case 90:
		{
		newdesign = [argument0[0],argument0[4],argument0[1],argument0[2],argument0[3]];
		break;
		}
	case 180:
		{
		newdesign = [argument0[0],argument0[3],argument0[4],argument0[1],argument0[2]];
		break;
		}
	case 270:
		{
		newdesign = [argument0[0],argument0[2],argument0[3],argument0[4],argument0[1]];
		break;
		}
	default:
		{
		newdesign = argument0;
		break;
		}
	}

//reorient walls
//if(newdesign

return newdesign;