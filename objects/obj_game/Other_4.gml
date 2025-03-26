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

	if (musica <> noone)
		audio_stop_sound(musica);
	musica = audio_play_sound(snd_musica1,1,true,0.5);

	velocidad_recuento = 60;

}
catch( _exception)
{
	show_message("Error en obj_game.RoomStart: "+_exception.longMessage);
}