/// @description 

tablero = {};
siguientes = {};
posicion_start = 0;
/*
	tablero es un struct de 48 posiciones, del 1 al 48
	Para acceder a la posicion de la fila superior se resta 8
	Para acceder a la posicion de la fila inferior se suma 8
	Izquierda y derecha se acceden restando o sumando 1
	Las posiciones (1,9,17,25,33,41) tienen pared a la izquierda
	Las posiciones (8,16,24,32,40,48) tienen pared a la derecha
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
	color = c_white;
	rellena = false; //para saber si tiene agua, porque entonces no se puede borrar
	subimage = 0; // para la animacion
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
	var _correcto = false;
	var _posicion = 0;
	var _rotacion = 0;
	while !(_correcto)
	{
		_posicion = irandom_range(1,48);
		_rotacion = choose(0,90,180,270);
		_correcto = true;
	
		if (_posicion >= 41 && _posicion <= 48 && _rotacion == 0)
			_correcto = false;
	
		var _array = [8,16,24,32,40,48];
		if (array_contains(_array,_posicion) && _rotacion == 90)
			_correcto = false;
		
		if (_posicion >= 1 && _posicion <= 8 && _rotacion == 180)
			_correcto = false;
		
		_array = [1,9,17,25,33,41];
		if (array_contains(_array,_posicion) && _rotacion == 270)
			_correcto = false;
	}
	tablero[$ _posicion] = new pieza(_posicion,TIPO_PIEZA.START,_rotacion);
	posicion_start = _posicion;
	
	siguientes = {};
	for (var _i = 1; _i <= 4; _i++)
	{
		var _tipo = 0;
		_rotacion = 0;
		var _numero = irandom_range(1,7);
		switch (_numero)
		{
			case 1: _tipo = TIPO_PIEZA.CRUCE; _rotacion = 0; break;
			case 2: _tipo = TIPO_PIEZA.CURVA; _rotacion = 0; break;
			case 3: _tipo = TIPO_PIEZA.CURVA; _rotacion = 90; break;
			case 4: _tipo = TIPO_PIEZA.CURVA; _rotacion = 180; break;
			case 5: _tipo = TIPO_PIEZA.CURVA; _rotacion = 270; break;
			case 6: _tipo = TIPO_PIEZA.RECTA; _rotacion = 0; break;
			case 7: _tipo = TIPO_PIEZA.RECTA; _rotacion = 90; break;
		}
		siguientes[$ _i] = new pieza(_i,_tipo,_rotacion);
		siguientes[$ _i]._x = (48+((((_i-1) mod 8)+1)*96)+((_i-1)*16));
		siguientes[$ _i]._y = 48+((int64((_i-1)/8)+7)*96);
	}
};

Inicializar();

function Sacar_una_pieza()
/// @function		Sacar_una_pieza()
/// @description	Quita la pieza de la ultima posicion del struct siguientes
{
	for (var _i = 4; _i >= 2; _i--)
	{
		siguientes[$ _i] = {};
		siguientes[$ _i] = new pieza(_i,siguientes[$ (_i-1)].tipo,siguientes[$ (_i-1)].rotacion);
		siguientes[$ _i]._x = (48+((((_i-1) mod 8)+1)*96)+((_i-1)*16));
		siguientes[$ _i]._y = 48+((int64((_i-1)/8)+7)*96);
	}
	
	var _i = 1;
	var _tipo = 0;
	var _rotacion = 0;
	var _numero = irandom_range(1,7);
	switch (_numero)
	{
		case 1: _tipo = TIPO_PIEZA.CRUCE; _rotacion = 0; break;
		case 2: _tipo = TIPO_PIEZA.CURVA; _rotacion = 0; break;
		case 3: _tipo = TIPO_PIEZA.CURVA; _rotacion = 90; break;
		case 4: _tipo = TIPO_PIEZA.CURVA; _rotacion = 180; break;
		case 5: _tipo = TIPO_PIEZA.CURVA; _rotacion = 270; break;
		case 6: _tipo = TIPO_PIEZA.RECTA; _rotacion = 0; break;
		case 7: _tipo = TIPO_PIEZA.RECTA; _rotacion = 90; break;
	}
	siguientes[$ _i] = {};
	siguientes[$ _i] = new pieza(_i,_tipo,_rotacion);
	siguientes[$ _i]._x = (48+((((_i-1) mod 8)+1)*96)+((_i-1)*16));
	siguientes[$ _i]._y = 48+((int64((_i-1)/8)+7)*96);
};