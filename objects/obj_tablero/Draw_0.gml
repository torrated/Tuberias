/// @description 

for (var _i = 1; _i <= 48; _i++)
{
	if (struct_exists(tablero,_i))
	{
		draw_sprite_ext(tablero[$ _i].sprite,
						0,
						//48+((((_i-1) mod 8)+1)*96),// x
						tablero[$ _i]._x,
						//48+((int64((_i-1)/8)+1)*96),// y
						tablero[$ _i]._y,
						1,1,
						tablero[$ _i].rotacion,
						c_white,1)
	}
};