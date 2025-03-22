/// @description 

try
{
	if (estado <> ESTADO_JUEGO.MENU)
	{
		estado = ESTADO_JUEGO.NORMAL;
	}

	sin_usar = [];
	especiales = [];
	alarm_0 = false;
	posicion = 0;
	velocidad_recuento = 30;
}
catch( _exception)
{
	show_message("Error en obj_game.RoomStart: "+_exception.longMessage);
}