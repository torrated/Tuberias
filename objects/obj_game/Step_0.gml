/// @description

if (estado == ESTADO_JUEGO.RECUENTO)
{
	if (alarm_0 == false)
	{
		with (obj_tablero)
		{
			for (var _i = 1; _i <= 48; _i++)
			{
				if (struct_exists(tablero,_i) && tablero[$ _i].rellena == false && _i <> obj_agua.posicion)
				{
					array_insert(other.sin_usar,-1,_i);
				}
			}
		}
	alarm_0 = true;
	alarm[0] = 1;
	}
}