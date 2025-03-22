/// @description 

try
{
	if (surface_exists(surf))
		surface_free(surf);
}
catch( _exception)
{
	show_message("Error en obj_surface.CleanUp: "+_exception.longMessage);
}