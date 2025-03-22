/// @description 

try
{
	draw_circle_color(x,y,48*(timer/obj_game.penalizacion_destruccion),c_red,c_yellow,false);

	var _color = draw_get_color();
	var _halign = draw_get_halign();
	var _font = draw_get_font();

	draw_set_color(c_red);
	draw_set_halign(fa_center);
	draw_set_font(global.fnt_fuente_numeros)
	draw_text(x,y,obj_puntos.reemplazo);
	draw_set_font(_font);

	draw_set_color(_color);
	draw_set_halign(_halign);
}
catch( _exception)
{
	show_message("Error en obj_penalizacion.Draw: "+_exception.longMessage);
}