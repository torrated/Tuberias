/// @description Cuenta las piezas especiales y las no usadas

if (array_length(especiales) > 0)
{ //ESPECIALES
	posicion = array_pop(especiales);
	obj_tablero.tablero[$ posicion].color = c_green;
	obj_puntos.puntos += obj_tablero.tablero[$ posicion].puntos;
	alarm[0] = velocidad_recuento;
}
else if (array_length(sin_usar) > 0)
{ //SIN USAR
	posicion = array_pop(sin_usar);
	obj_tablero.tablero[$ posicion].color = c_red;
	obj_puntos.puntos += obj_puntos.pieza_sin_usar;
	alarm[0] = velocidad_recuento;
}
else if (array_length(cruces_dobles) > 0)
{ //CRUCES DOBLES
	posicion = array_pop(cruces_dobles);
	obj_tablero.tablero[$ posicion].color = c_green;
	obj_puntos.puntos += obj_puntos.reusar_cruce;
	alarm[0] = velocidad_recuento;
}
else // ya no hay más piezas
{
	posicion = 0;
	if (obj_puntos.puntos >= puntos_goal)
	{
		estado = ESTADO_JUEGO.LEVEL_COMPLETE;
	}
	else
	{
		estado = ESTADO_JUEGO.GAMEOVER;
	}
}