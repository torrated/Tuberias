/// @description 

enum ESTADO_JUEGO
{
    NORMAL,
	PAUSA,
	RECUENTO,
	FIN,
	DESTRUYENDO
};

estado = ESTADO_JUEGO.NORMAL;
sin_usar = [];
alarm_0 = false;
posicion = 0;
penalizacion_destruccion = 3*60;

puntos_nivel = 250;