/// @description Inicia el recuento

if (estado == ESTADO_JUEGO.RECUENTO)
{
	if (alarm_0 == false)
	{
		with (obj_tablero)
		{
			for (var _i = 1; _i <= 48; _i++)
			{
				//SIN USAR
				if (struct_exists(tablero,_i) 
					&& tablero[$ _i].rellena == false 
					&& _i <> obj_agua.posicion
					&& !array_contains(PIEZAS_NO_DESTRUIBLES,tablero[$ _i].tipo)
					)
				{
					array_insert(other.sin_usar,-1,_i);
				}
				//PUNTOS
				if (struct_exists(tablero,_i) 
					&& tablero[$ _i].rellena == true 
					&& _i <> obj_agua.posicion
					&& tablero[$ _i].tipo == TIPO_PIEZA.PUNTOS)
				{
					array_insert(other.especiales,-1,_i);
				}
			}
		}
	alarm_0 = true;
	alarm[0] = 1;
	}
	if (keyboard_check_pressed(vk_space))
		velocidad_recuento = 30;
}