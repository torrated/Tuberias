/// @description Reduce el timer

try
{
	if !(obj_game.estado == ESTADO_JUEGO.NORMAL || obj_game.estado == ESTADO_JUEGO.DESTRUYENDO)
		alarm[0] = timer;
	else{
		tiempo -= timer/60;
		if (tiempo > 0)
			alarm[0] = timer;
		else if !(instance_exists(obj_agua))
		{
			var _x = obj_tablero.tablero[$ obj_tablero.posicion_start]._x;
			var _y = obj_tablero.tablero[$ obj_tablero.posicion_start]._y;
			instance_create_layer(_x,_y,"Agua",obj_agua);
		}
	}
}catch( _exception)
{
	show_message("Error en obj_timer.Alarm0: "+_exception.longMessage);
}