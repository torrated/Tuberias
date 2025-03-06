/// @description 

// Piezas del tablero
for (var _i = 1; _i <= 48; _i++)
{
	if (struct_exists(tablero,_i))
	{
		draw_sprite_ext(tablero[$ _i].sprite,
						tablero[$ _i].subimage,
						tablero[$ _i]._x,
						tablero[$ _i]._y,
						1,1,
						tablero[$ _i].rotacion,
						tablero[$ _i].color
						,1)
	}
};

// Piezas siguientes
var _color = c_gray;
for (var _i = 1; _i <= 4; _i++)
{
	if (struct_exists(siguientes,_i))
	{
		if (_i = 4)
			_color = c_white;
		draw_sprite_ext(siguientes[$ _i].sprite,
						0,
						siguientes[$ _i]._x,
						siguientes[$ _i]._y,
						1,1,
						siguientes[$ _i].rotacion,
						_color,
						1)
	}
};