/// @description 

/*
	48 puntos por pieza hasta alcanzar el mínimo
	100 puntos por pieza por cada seccion extra
	500 puntos por cruzar un cruce
	
	-100 puntos por pieza sin usar
	-50 puntos por reemplazar piezas
*/

puntos = 0;
puntos_nivel = obj_game.puntos_goal;

puntos_normal = 1;
puntos_extra = 3;
reusar_cruce = 500;
pieza_sin_usar = -100;
reemplazo = -50;