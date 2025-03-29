/// @description Inicia el recuento

try
{
	if (estado == ESTADO_JUEGO.RECUENTO)
	{
		if (alarm_0 == false)
		{
			if (obj_timer.sonido <> noone)
				audio_stop_sound(obj_timer.sonido);
			//audio_play_sound(snd_stop,1,false);
			with (obj_tablero)
			{
				for (var _i = 1; _i <= 48; _i++)
				{
					//SIN USAR
					if (struct_exists(tablero,_i) 
						&& tablero[$ _i].rellena == false 
						&& !array_contains(PIEZAS_NO_DESTRUIBLES,tablero[$ _i].tipo)
						)
					{
						array_insert(other.sin_usar,-1,_i);
					}
					//PUNTOS
					if (struct_exists(tablero,_i) 
						&& tablero[$ _i].rellena == true 
						&& tablero[$ _i].tipo == TIPO_PIEZA.PUNTOS)
					{
						array_insert(other.especiales,-1,_i);
					}
					//CRUCES DOBLES
					if (struct_exists(tablero,_i) 
						&& tablero[$ _i].rellena == true 
						&& tablero[$ _i].tipo == TIPO_PIEZA.CRUCE
						&& tablero[$ _i].cruce_doble == 2)
					{
						array_insert(other.cruces_dobles,-1,_i);
						tablero[$ _i].puntos = obj_puntos.reusar_cruce;
					}
				}
			}
		alarm_0 = true;
		alarm[0] = 1;
		}
		if (keyboard_check_pressed(vk_space))
			velocidad_recuento = 60;
	}
}
catch( _exception)
{
	show_message("Error en obj_game.step: "+_exception.longMessage);
}