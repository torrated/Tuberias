/// @description Inserte aquí la descripción
// Puede escribir su código en este editor
try
{
	obj_game.estado = ESTADO_JUEGO.NORMAL; layer_sequence_destroy(obj_game.secuencia); room_goto(Room1); 
}
catch( _exception)
{
	show_message("Error en obj_stop.KeyPressEscape: "+_exception.longMessage);
}