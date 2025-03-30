/// @description Cuenta las piezas especiales y las no usadas

try
{
	if (array_length(especiales) > 0)
	{ //ESPECIALES
		posicion = array_pop(especiales);
		obj_tablero.tablero[$ posicion].color = c_green;
		obj_puntos.puntos += obj_tablero.tablero[$ posicion].puntos;
		audio_play_sound(snd_puntos,1,false,obj_game.volumen_sonido);
		alarm[0] = velocidad_recuento;
	}
	else if (array_length(sin_usar) > 0)
	{ //SIN USAR
		posicion = array_pop(sin_usar);
		obj_tablero.tablero[$ posicion].color = c_red;
		obj_puntos.puntos += obj_puntos.pieza_sin_usar;
		audio_play_sound(snd_penalizacion,1,false,obj_game.volumen_sonido);
		alarm[0] = velocidad_recuento;
	}
	else if (array_length(cruces_dobles) > 0)
	{ //CRUCES DOBLES
		posicion = array_pop(cruces_dobles);
		obj_tablero.tablero[$ posicion].color = c_green;
		obj_puntos.puntos += obj_puntos.reusar_cruce;
		audio_play_sound(snd_puntos,1,false,obj_game.volumen_sonido);
		alarm[0] = velocidad_recuento;
	}
	else // ya no hay más piezas
	{
		posicion = 0;
		if (obj_puntos.puntos >= puntos_goal)
		{
			estado = ESTADO_JUEGO.LEVEL_COMPLETE;
			audio_play_sound(snd_levelcomplete,1,false,obj_game.volumen_sonido);
		}
		else
		{
			estado = ESTADO_JUEGO.GAMEOVER;
		}
	}
}
catch( _exception)
{
	show_message("Error en obj_game.Alarm0: "+_exception.longMessage);
}