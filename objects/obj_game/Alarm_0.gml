/// @description Destruye piezas sin usar

if (array_length(sin_usar) > 0)
{
	posicion = array_pop(sin_usar);
	obj_tablero.tablero[$ posicion].color = c_red;
	obj_puntos.puntos += obj_puntos.pieza_sin_usar;
	alarm[0] = 60;
}
else
	posicion = 0;