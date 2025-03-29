/// @description 
try
{
	enum ESTADO_JUEGO
	{
	    NORMAL,
		PAUSA,
		RECUENTO,
		FIN,
		DESTRUYENDO,
		LEVEL_COMPLETE,
		GAMEOVER,
		MENU,
		SECUENCIA
	};

	estado = ESTADO_JUEGO.MENU;
	sin_usar = [];
	especiales = [];
	cruces_dobles = [];

	alarm_0 = false;
	posicion = 0;
	penalizacion_destruccion = 3*60;

	puntos_goal = 250;
	nivel = 1;

	musica = noone;

	velocidad_recuento = 60;
	
	secuencia = noone;
}
catch( _exception)
{
	show_message("Error en obj_game.create: "+_exception.longMessage);
}