/// @description 

switch(estado)
{
	case ESTADO_JUEGO.NORMAL:	estado = ESTADO_JUEGO.PAUSA; break;
	case ESTADO_JUEGO.PAUSA:	estado = ESTADO_JUEGO.NORMAL; break;
	//case ESTADO_JUEGO.SECUENCIA:	estado = ESTADO_JUEGO.NORMAL; layer_sequence_destroy(secuencia); room_goto(Room1); break;
}