/// @description Vuelve al estado normal

try
{
	if (obj_game.estado == ESTADO_JUEGO.DESTRUYENDO)
	{
		estado = ESTADO_JUEGO.NORMAL;
	}
}
catch( _exception)
{
	show_message("Error en obj_game.Alarm1: "+_exception.longMessage);
}