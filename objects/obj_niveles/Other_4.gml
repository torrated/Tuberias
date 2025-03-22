/// @description 

try
{
	var _numero = niveles_piezas_negras[$ obj_game.nivel];
	for (var _i = 1; _i <= _numero; _i++)
		Coloca_pieza_negra();

	_numero = niveles_piezas_puntos[$ obj_game.nivel];
	for (var _i = 1; _i <= _numero; _i++)
		Coloca_pieza_puntos();
}
catch( _exception)
{
	show_message("Error en obj_niveles.RoomStart: "+_exception.longMessage);
}