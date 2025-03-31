/// @description 

try
{
	var _color = draw_get_color();
	var _halign = draw_get_halign();
	
	draw_set_halign(fa_center);
	
	if (obj_game.estado == ESTADO_JUEGO.PAUSA)
	{
		var _i = 1;
		
		if (mouse_x > (display_get_gui_width()/2)-50 && mouse_x < (display_get_gui_width()/2)+50
			&& mouse_y > display_get_gui_height()/2 && mouse_y < (display_get_gui_height()/2)+80)
			{
				var _pos = int64((mouse_y-display_get_gui_height()/2)/30)+1;
				opcion_actual = _pos;
				usa_raton = true;
			}
		else
			usa_raton = false;
		do
		{
			if (_i == opcion_actual)
				draw_set_color(c_red);
			else
				draw_set_color(c_white);
			
			if (menu[$ "2"].dentro == false)
				draw_text(display_get_gui_width()/2,display_get_gui_height()/2+((_i-1)*30),menu[$ _i].texto);
			else 
			{
				var _texto = "";
				if (_i == 1)
					_texto = ": "+string(obj_game.volumen_musica);
				if (_i == 2)
					_texto = ": "+string(obj_game.volumen_sonido);
					
				draw_text(display_get_gui_width()/2,
						  display_get_gui_height()/2+((_i-1)*30),
						  menu[$ "2"].submenu[$ _i].texto+_texto);
			}
		    
			_i += 1;
		} until !(struct_exists(menu,_i));
	}
	
	draw_set_color(_color);
	draw_set_halign(_halign);
}
catch( _exception)
{
	show_message("Error en obj_menuescape.Draw:\n"+_exception.longMessage);
}