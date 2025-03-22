/// @description 

try
{
	timer -= 1;
	if (timer <= 0)
		instance_destroy();
}
catch( _exception)
{
	show_message("Error en obj_penalizacion.Step: "+_exception.longMessage);
}