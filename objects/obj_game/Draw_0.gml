/// @description Pinta las penalizaciones y bonus en pantalla

if (posicion <> 0)
{
	var _halign = draw_get_halign();
	var _color = draw_get_color();
	var _font = draw_get_font();
	
	draw_set_halign(fa_center);
	draw_set_font(global.fnt_fuente_numeros);
	if (obj_tablero.tablero[$ posicion].rellena == true)
	{
		draw_set_color(c_white);
		draw_text(obj_tablero.tablero[$ posicion]._x,obj_tablero.tablero[$ posicion]._y,obj_tablero.tablero[$ posicion].puntos);
	}
	else
	{
		draw_set_color(c_red);
		draw_text(obj_tablero.tablero[$ posicion]._x,obj_tablero.tablero[$ posicion]._y,obj_puntos.pieza_sin_usar);
	}
	
	draw_set_halign(_halign);
	draw_set_color(_color);
	draw_set_font(_font);
}