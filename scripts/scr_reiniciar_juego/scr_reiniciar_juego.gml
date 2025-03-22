function scr_reiniciar_juego()
{
	room_goto(Room_menu);
	
	with (obj_agua)
		instance_destroy();
		
	with (obj_game)
	{
		estado = ESTADO_JUEGO.MENU;
		sin_usar = [];
		especiales = [];
		cruces_dobles = [];

		alarm_0 = false;
		posicion = 0;
		penalizacion_destruccion = 3*60;

		puntos_goal = 250;
		nivel = 1;
		velocidad_recuento = 30;
	}
	
	with (obj_niveles)
	{
		ejecutado = false;
		recurrente = false;
		borrar = 0;
	}
	
	with (obj_penalizacion)
		instance_destroy();
	
	with (obj_puntos)
	{
		puntos = 0;
		puntos_nivel = obj_game.puntos_goal;
	}
	
	with (obj_raton)
		pieza = {};
		
	with (obj_tablero)
	{
		tablero = {};
		siguientes = {};
		posicion_start = 0;
	}
	
	with (obj_timer)
	{
		tiempo = tiempo_max;
		timer = 1;
	}
	
	with (obj_surface)
		instance_destroy();
		
}