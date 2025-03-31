/// @description 

try
{
	if (estado <> ESTADO_JUEGO.MENU)
	{
		estado = ESTADO_JUEGO.NORMAL;
	}

	sin_usar = [];
	especiales = [];
	alarm_0 = false;
	posicion = 0;

	audio_stop_all();
	audio_group_load(ag_musica);
	audio_group_load(ag_agua);
	audio_group_set_gain(ag_musica,obj_game.volumen_musica,0);
	audio_group_set_gain(ag_agua,obj_game.volumen_sonido/10,0);
	
	if (musica <> noone)
		audio_stop_sound(musica);
	musica = audio_play_sound(snd_musica1,1,true);

	velocidad_recuento = 60;

}
catch( _exception)
{
	show_message("Error en obj_game.RoomStart: "+_exception.longMessage);
}