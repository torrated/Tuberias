/// @description 
var _columna = 100;
var _fila = 30;
var _i = 30;
draw_text(_columna,_fila,"FPS real: "+string(fps_real)); _fila += _i;

with(obj_tablero)
{
	//for (var _i=1; _i <= 48; _i++)
	//{
	//	if (struct_exists(tablero,_i))
	//	{
	//		draw_text(_columna,_fila,string(_i)+string(tablero[$ _i])); _fila += _i;
	//	}
	//}
}

//draw_set_alpha(0.25);
//var _x = int64(mouse_x/96)*96;
//var _y = int64(mouse_y/96)*96;
//draw_rectangle(_x,_y,_x+96,_y+96,false);

//draw_set_alpha(1);
//draw_text(mouse_x,mouse_y,string(int64(mouse_x/96)  +     (8* (int64(mouse_y/96)-1))));