/// @description 

tablero = {};
siguientes = {};
/*
	tablero es un struct de 48 posiciones, del 1 al 48
	Para acceder a la posicion de la fila superior se resta 8
	Para acceder a la posicion de la fila inferior se suma 8
	Izquierda y derecha se acceden restando o sumando 1
	Las posiciones 1+8*n[0-5] (1,9,17,25,33,41) tienen pared a la izquierda
	Las posiciones 8*n[1-6] (8,16,24,32,40,48) tienen pared a la derecha
	Las posiciones [1-8] tienen pared arriba
	Las posiciones [41-48] tienen pared abajo

	Cada posicion contiene un struct pieza
*/

pieza = function(_posicion,_tipo,_rotacion) constructor
/// @function					Pieza(_posicion,_tipo,_rotacion)
/// @description				Piezas y sus caracteristicas
{
	posicion = _posicion;
	tipo = _tipo;
	rotacion = _rotacion;
	switch(tipo)
			{
				case TIPO_PIEZA.START: sprite = spr_start; break;
				case TIPO_PIEZA.RECTA: sprite = spr_recta; break;
				case TIPO_PIEZA.CURVA: sprite = spr_curva; break;
				case TIPO_PIEZA.CRUCE: sprite = spr_cruce; break;
			};
	_x = 48+((((posicion-1) mod 8)+1)*96);
	_y = 48+((int64((posicion-1)/8)+1)*96);
};

enum TIPO_PIEZA {
	START,
	RECTA,
	CURVA,
	CRUCE
};

function Inicializar()
/// @function		Inicializar()
/// @description	Inicializa el tablero
{
	randomize();
	tablero = {};
	var _posicion = irandom_range(1,48);
	var _rotacion = choose(0,90,180,270);
	tablero[$ _posicion] = new pieza(_posicion,TIPO_PIEZA.START,_rotacion);
	
	siguientes = {};
	for (var _i = 1; _i <= 4; _i++)
	{
		siguientes[$ _i] = new pieza(_i,choose(TIPO_PIEZA.RECTA,TIPO_PIEZA.CURVA,TIPO_PIEZA.CRUCE),choose(0,90,180,270));
		siguientes[$ _i]._x = (48+((((_i-1) mod 8)+1)*96)+((_i-1)*16));
		siguientes[$ _i]._y = 48+((int64((_i-1)/8)+7)*96);
	}
};

Inicializar();