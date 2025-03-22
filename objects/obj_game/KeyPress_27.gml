/// @description 

switch(estado)
{
	case ESTADO_JUEGO.NORMAL:	estado = ESTADO_JUEGO.PAUSA; break;
	case ESTADO_JUEGO.PAUSA:	estado = ESTADO_JUEGO.NORMAL; break;
}