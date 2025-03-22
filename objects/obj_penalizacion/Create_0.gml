/// @description 

try
{
	timer = obj_game.penalizacion_destruccion;
}
catch( _exception)
{
	show_message("Error en obj_penalizacion.create: "+_exception.longMessage);
}