/// @description 
var _columna = 100;
var _fila = 30;
var _i = 30;
draw_text(_columna,_fila,"FPS real: "+string(fps_real)); _fila += _i;
with (obj_agua)
	draw_text(_columna,_fila,"test_borde "+string(test_borde)); _fila += _i;

//if (mouse_check_button(mb_left))
//	draw_text(_columna,_fila,"left click"); _fila += _i;