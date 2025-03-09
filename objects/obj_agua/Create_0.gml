/// @description

velocidad = 1;
alarm[0] = velocidad;
posicion = obj_tablero.posicion_start;
distancia_maxima = 48;
distancia = distancia_maxima;
test_borde = true;

switch(obj_tablero.tablero[$ obj_tablero.posicion_start].rotacion)
{
	case 0:		dir_x = 0; dir_y = 1; break;
	case 90:	dir_x = 1; dir_y = 0; break;
	case 180:	dir_x = 0; dir_y = -1; break;
	case 270:	dir_x = -1; dir_y = 0; break;
};

velocidad_movimiento = 1;