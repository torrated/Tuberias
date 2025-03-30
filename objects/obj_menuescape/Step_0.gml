/// @description 

try
{
	if (obj_game.estado == ESTADO_JUEGO.PAUSA)
	{
		var _movimiento = keyboard_check_pressed(vk_down) - keyboard_check_pressed(vk_up);
		if (_movimiento <> 0)
			audio_play_sound(snd_coger,1,false,obj_game.volumen_sonido);

		opcion_actual = clamp(opcion_actual+_movimiento,1,3);
		
		if (keyboard_check_pressed(vk_enter))
		{
			if (menu[$ "2"].dentro == false) //menu principal
			{
				switch(opcion_actual)
				{
					case 1: obj_game.estado = ESTADO_JUEGO.NORMAL; break;
					case 2: menu[$ "2"].dentro = true; break;
					case 3: scr_reiniciar_juego(); break;
				}
			}
			else //menu Audio
			{
				switch(opcion_actual)
				{
					case 1: break;
					case 2: break;
					case 3: menu[$ "2"].dentro = false break;
				}
			}
		}
		
		var _horizontal = keyboard_check_pressed(vk_right)-keyboard_check_pressed(vk_left);
		if (_horizontal <> 0 && menu[$ "2"].dentro)
		{
			if (opcion_actual == 1)
			{
				obj_game.volumen_musica += (0.10*_horizontal);
				audio_group_set_gain(ag_musica,obj_game.volumen_musica,0);
			}
			if (opcion_actual == 2)
			{
				obj_game.volumen_sonido += (0.10*_horizontal);
				audio_play_sound(snd_coger,1,false,obj_game.volumen_sonido);
				audio_group_set_gain(ag_agua,obj_game.volumen_sonido/10,0);
			}
			
			obj_game.volumen_sonido = clamp(obj_game.volumen_sonido,0,1);
			obj_game.volumen_musica = clamp(obj_game.volumen_musica,0,1);
		}
	}
	else
	{
		opcion_actual = 1;
		menu[$ "2"].dentro = false;
	}
}
catch( _exception)
{
	show_message("Error en obj_menuescape.Step:\n"+_exception.longMessage);
}