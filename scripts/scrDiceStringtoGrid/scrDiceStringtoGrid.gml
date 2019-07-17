/// @function scrDiceStringtoGrid(string)
/// @description Parses a string of dice into a grid
/// @param {string} string The string to parse

/*
example:
	flaming holy sword
	string: "S:1d4;F:2d6,+3;H:2d4,2d6,+2"
		str: 1d4
		fire: 2d6+3
		holy: 2d4+2,1d6

abbreviations:
str, dex, int: S,D,I
fire, ice, earth, wind: F,W,E,A
lightning, poison, dark, holy: L,P,D,H
*/
