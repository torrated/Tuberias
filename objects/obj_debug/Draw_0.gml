/// @description 
var _columna = 100;
var _fila = 30;
var _i = 30;
draw_text(_columna,_fila,"FPS real: "+string(fps_real)); _fila += _i;
switch (obj_game.estado)
{
	case 0: draw_text(_columna,_fila,"estado: NORMAL"); _fila += _i; break;
	case 1: draw_text(_columna,_fila,"estado: PAUSA"); _fila += _i; break;
	case 2: draw_text(_columna,_fila,"estado: RECUENTO"); _fila += _i; break;
	case 3: draw_text(_columna,_fila,"estado: FIN"); _fila += _i; break;
	case 4: draw_text(_columna,_fila,"estado: DESTRUYENDO"); _fila += _i; break;
}

//if (mouse_check_button(mb_left))
//	draw_text(_columna,_fila,"left click"); _fila += _i;
