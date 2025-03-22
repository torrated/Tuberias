/// @description 

enum ESTADO_JUEGO
{
    NORMAL,
	PAUSA,
	RECUENTO,
	FIN,
	DESTRUYENDO,
	LEVEL_COMPLETE,
	GAMEOVER,
	MENU
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
velocidad_recuento = 120;