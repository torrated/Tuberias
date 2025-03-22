/// @description 

try
{
	tiempo_max = 20;
	tiempo = tiempo_max;
	timer = 1;
	alarm[0] = timer;
}
catch( _exception)
{
	show_message("Error en obj_timer.create: "+_exception.longMessage);
}