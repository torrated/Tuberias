/// @description 
var _columna = 100;
var _fila = 30;
var _i = 30;
draw_text(_columna,_fila,"FPS real: "+string(fps_real)); _fila += _i;

with(obj_tablero)
{
}

if (mouse_check_button(mb_left))
	draw_text(_columna,_fila,"left click"); _fila += _i;

//with (obj_raton)
//{
//	draw_text(_columna,_fila,pieza); _fila += _i;

//	//if (struct_exists(pieza,"sprite"))
//	//{
//	//	draw_sprite_ext(pieza.sprite,0,mouse_x,mouse_y,1,1,pieza.rotacion,c_white,1);
//	//	draw_text(_columna,_fila,pieza.sprite); _fila += _i;
//	//	//draw_sprite(pieza.sprite,1,mouse_x,mouse_y)
//	//}
//}

//draw_set_alpha(0.25);
//var _x = int64(mouse_x/96)*96;
//var _y = int64(mouse_y/96)*96;
//draw_rectangle(_x,_y,_x+96,_y+96,false);

//draw_set_alpha(1);
//draw_text(mouse_x,mouse_y,string(int64(mouse_x/96)  +     (8* (int64(mouse_y/96)-1))));