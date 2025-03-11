/// @description 

global.res_width = 960;
global.res_height = 768;

var _ratio = global.res_width / global.res_height;

if (display_get_width() < global.res_width || display_get_height() < global.res_height)
{
	var _ancho = display_get_width() / global.res_width;//724 / 960 = 0,75
	var _alto = display_get_height() / global.res_height;//292 / 768 = 0,38 
	if (_ancho <= _alto)
	{
		global.res_width = display_get_width();
		global.res_height = display_get_width() / _ratio;
	}
	else
	{
		global.res_height = display_get_height();
		global.res_width = global.res_height * _ratio;
	}
}

window_set_size(global.res_width, global.res_height);
surface_resize(application_surface, global.res_width, global.res_height);
room_width = global.res_width;
room_height = global.res_height;