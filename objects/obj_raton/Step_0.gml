/// @description 

try
{
	if !(obj_game.estado == ESTADO_JUEGO.NORMAL || obj_game.estado == ESTADO_JUEGO.PAUSA)
	{
			pieza = {}
	}



	if (obj_game.estado == ESTADO_JUEGO.NORMAL)
	{
		var _colocable = false;

		if (mouse_check_button_pressed(mb_left))
		{
			// coger la pieza siguiente
			if (mouse_x >= obj_tablero.siguientes[$ 4]._x - 48
				&& mouse_x <= obj_tablero.siguientes[$ 4]._x + 48
				&& mouse_y >= obj_tablero.siguientes[$ 4]._y - 48
				&& mouse_y <= obj_tablero.siguientes[$ 4]._y + 48
				&& !struct_exists(pieza,"_x")
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
				if (mouse_x >= 96 && mouse_x <= 864 && mouse_y >= 96 && mouse_y <= 672)
				{
					var _posicion = int64(mouse_x/96) + (8* (int64(mouse_y/96)-1));
					if (struct_exists(obj_tablero.tablero,_posicion))
					{
						if (obj_tablero.tablero[$ _posicion].tipo <> TIPO_PIEZA.START && !obj_tablero.tablero[$ _posicion].rellena)
						if (!array_contains(obj_tablero.PIEZAS_NO_DESTRUIBLES,obj_tablero.tablero[$ _posicion].tipo) && !obj_tablero.tablero[$ _posicion].rellena)
						{
							_colocable = true;
							obj_game.estado = ESTADO_JUEGO.DESTRUYENDO;
							obj_game.alarm[1] = obj_game.penalizacion_destruccion;
						}
					}
					else
					{
						_colocable = true;
					}
		
					if (_colocable)
					{
						obj_tablero.tablero[$ _posicion] = new obj_tablero.pieza(_posicion,pieza.tipo,pieza.rotacion);
						obj_tablero.tablero[$ _posicion].puntos = pieza.puntos;
						pieza = {};
						if (obj_game.estado == ESTADO_JUEGO.DESTRUYENDO)
						{
							obj_puntos.puntos += obj_puntos.reemplazo;
							var _penalizacion = instance_create_layer(obj_tablero.tablero[$ _posicion]._x,obj_tablero.tablero[$ _posicion]._y,"Penalizacion",obj_penalizacion);
						}
						obj_niveles.Comprueba_nivel(obj_game.nivel); //mira a ver si hay que hacer algo despues de colocar la pieza
					}
				}
			}
		}
	}

	if (obj_game.estado == ESTADO_JUEGO.LEVEL_COMPLETE)
	{
		if (mouse_check_button_pressed(mb_left))
		{
			obj_game.nivel += 1;
			obj_puntos.puntos_nivel += 50;
			obj_game.puntos_goal = obj_puntos.puntos + obj_puntos.puntos_nivel;
			room_restart();
		}
	}

	if (obj_game.estado == ESTADO_JUEGO.MENU)
	{
		if (mouse_check_button_pressed(mb_left))
		{
			obj_game.estado = ESTADO_JUEGO.NORMAL;
			room_goto(Room1);
		}
	}

	if (obj_game.estado == ESTADO_JUEGO.GAMEOVER)
	{
		if (mouse_check_button_pressed(mb_left))
		{
			scr_reiniciar_juego();
		}
	}
}
catch( _exception)
{
	show_message("Error en obj_raton.Step: "+_exception.longMessage);
}