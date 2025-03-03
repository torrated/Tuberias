/// @description 

if (mouse_check_button_pressed(mb_left))
{
	// coger la pieza siguiente
	if (mouse_x >= obj_tablero.siguientes[$ 4]._x - 48
		&& mouse_x <= obj_tablero.siguientes[$ 4]._x + 48
		&& mouse_y >= obj_tablero.siguientes[$ 4]._y - 48
		&& mouse_y <= obj_tablero.siguientes[$ 4]._y + 48
		)
	{
		pieza = obj_tablero.siguientes[$ 4];
		with (obj_tablero)
		{
			Sacar_una_pieza();
		}
	}
	else if (struct_exists(pieza,"_x")) //colocar pieza
	{
		var _posicion = int64(mouse_x/96) + (8* (int64(mouse_y/96)-1));
		obj_tablero.tablero[$ _posicion] = new obj_tablero.pieza(_posicion,pieza.tipo,pieza.rotacion);
		pieza = {};
	}
};