function StringSplit(argument0, argument1) {
	/// @function StringSplit(string, delimiter)
	/// @description Splits a string into an array every time the delimiter is found
	/// @param {string} string The string to parse
	/// @param {string} delimiter The character to split the string at
	var _str = argument0;
	var _split = argument1;
	var _list = ds_list_create();
	var _number = string_count(_split, _str);
	if(_number == 0)
		{ds_list_add(_list, _str);}
	else
		{
	    for (var _i = 0; _i < _number; _i++)
			{
	        var _pos = string_pos(_split, _str);
	        ds_list_add(_list, string_copy(_str, 1, _pos-1));
	        _str = string_delete(_str, 1, _pos);
			}
	    ds_list_add(_list, _str);
		}
	return _list;
	}
