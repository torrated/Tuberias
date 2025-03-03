/// @description 

var _color = draw_get_color();
var _halign = draw_get_halign();
var _valign = draw_get_valign();

// VERSION
draw_set_color(c_white);
draw_set_halign(fa_right);
draw_set_valign(fa_bottom);
draw_text(room_width,room_height,"v0.1");


draw_set_color(_color);
draw_set_halign(_halign);
draw_set_valign(_valign);


with (obj_raton)
{
	if (struct_exists(pieza,"sprite"))
	{
		var _x = (int64(mouse_x/96)*96)+48;
		var _y = (int64(mouse_y/96)*96)+48;
		draw_sprite_ext(pieza.sprite,0,_x,_y,1,1,pieza.rotacion,c_white,1);
	}
}