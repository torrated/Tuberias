/// @description 

if (mouse_check_button(mb_left)
	&& mouse_x >= obj_tablero.siguientes[$ 4]._x - 48
	&& mouse_x <= obj_tablero.siguientes[$ 4]._x + 48
	&& mouse_y >= obj_tablero.siguientes[$ 4]._y - 48
	&& mouse_y <= obj_tablero.siguientes[$ 4]._y + 48
	)
{
	pieza = obj_tablero.siguientes[$ 4];
};