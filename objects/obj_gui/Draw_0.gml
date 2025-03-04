/// @description 

var _color = draw_get_color();
var _halign = draw_get_halign();
var _valign = draw_get_valign();

// VERSION
draw_set_color(c_white);
draw_set_halign(fa_right);
draw_set_valign(fa_bottom);
draw_text(room_width,room_height,"v0.1");

// TIMER
draw_set_halign(fa_right);
draw_text(room_width,120,"TIME");
draw_text(room_width,140,string(obj_timer.tiempo));

//PIEZA EN RATON
with (obj_raton)
{
	if (struct_exists(pieza,"sprite"))
	{
		var _x = (int64(mouse_x/96)*96)+48;
		var _y = (int64(mouse_y/96)*96)+48;
		var _posicion = int64(mouse_x/96) + (8* (int64(mouse_y/96)-1));
		var _newcolor = c_white;
		var _alpha = 1;
		if (struct_exists(obj_tablero.tablero,_posicion))
		{
			_newcolor = c_red;
			_alpha = 0.5;
		}
		draw_sprite_ext(pieza.sprite,0,_x,_y,1,1,pieza.rotacion,_newcolor,_alpha);
	}
}


draw_set_color(_color);
draw_set_halign(_halign);
draw_set_valign(_valign);