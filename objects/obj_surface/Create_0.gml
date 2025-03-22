/// @description

try
{
	surf = surface_create(room_width,room_height);
	surface_set_target(surf);
	surface_reset_target();
}
catch( _exception)
{
	show_message("Error en obj_surface.create: "+_exception.longMessage);
}