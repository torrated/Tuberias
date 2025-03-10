/// @description 

var _color = draw_get_color();
var _halign = draw_get_halign();
var _valign = draw_get_valign();

// VERSION
draw_set_color(c_white);
draw_set_halign(fa_right);
draw_set_valign(fa_bottom);
draw_text(room_width,room_height,"v0.4");

// TIMER
draw_set_color(c_white);
draw_set_halign(fa_center);
var _fuente = draw_get_font();
draw_set_font(global.fnt_fuente);
draw_text_transformed(905,120,"TIME",0.4,0.4,0);
draw_set_font(_fuente);

draw_text(896,140,string(obj_timer.tiempo));
draw_healthbar(896,140,912,672,(obj_timer.tiempo*100/obj_timer.tiempo_max),c_black,c_red,c_green,3,false,true);

//PIEZA EN RATON
with (obj_raton)
{
	if (struct_exists(pieza,"sprite"))
	{
		var _x = (int64(mouse_x/96)*96)+48;
		var _y = (int64(mouse_y/96)*96)+48;
		var _posicion = int64(mouse_x/96) + (8* (int64(mouse_y/96)-1));
		var _newcolor = c_yellow;
		var _alpha = 1;
		if (struct_exists(obj_tablero.tablero,_posicion))
		{
			_newcolor = c_red;
			_alpha = 0.5;
		}
		draw_sprite_ext(pieza.sprite,0,_x,_y,1,1,pieza.rotacion,_newcolor,_alpha);
	}
}

//PUNTOS
draw_text(576,700,"GOAL: "+string(obj_game.puntos_goal));
draw_text(760,700,"SCORE: "+string(obj_puntos.puntos));

//LEVEL
draw_set_color(c_red);
draw_text(760,730,"LEVEL: "+string(obj_game.nivel));

//PAUSA
if (obj_game.estado == ESTADO_JUEGO.PAUSA)
{
	draw_set_color(c_white);
	draw_set_halign(fa_center);
	var _fuente = draw_get_font();
	draw_set_font(global.fnt_fuente);
	draw_text(room_width/2,room_height/2,"PAUSE");
	draw_set_font(_fuente);
}

//LEVEL COMPLETE
if (obj_game.estado == ESTADO_JUEGO.LEVEL_COMPLETE)
{
	draw_set_color(c_white);
	draw_set_halign(fa_center);
	draw_text(room_width/2,room_height/2,"LEVEL COMPLETE");
	draw_text(room_width/2,(room_height/2)+50,"Click to continue");
}

//GAME OVER
if (obj_game.estado == ESTADO_JUEGO.GAMEOVER)
{
	draw_set_color(c_white);
	draw_set_halign(fa_center);
	draw_text(room_width/2,room_height/2,"GAME OVER");
	draw_text(room_width/2,(room_height/2)+50,"Click to restart");
}

draw_set_color(_color);
draw_set_halign(_halign);
draw_set_valign(_valign);