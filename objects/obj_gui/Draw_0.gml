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