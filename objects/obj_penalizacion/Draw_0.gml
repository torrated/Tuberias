/// @description 

draw_circle_color(x,y,48*(timer/obj_game.penalizacion_destruccion),c_red,c_yellow,false);

var _color = draw_get_color();
var _halign = draw_get_halign();

draw_set_color(c_white);
draw_set_halign(fa_center);
draw_text(x,y,obj_puntos.reemplazo);