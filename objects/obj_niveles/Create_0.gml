/// @description 

try
{
	ejecutado = false;
	recurrente = false;
	borrar = 0;
	niveles_piezas_negras = {};
	niveles_piezas_negras[$ 2] = 1;
	niveles_piezas_negras[$ 5] = 2;
	niveles_piezas_negras[$ 8] = 3;
	niveles_piezas_negras[$ 11] = 4;
	niveles_piezas_negras[$ 14] = 5;

	niveles_piezas_puntos = {};
	niveles_piezas_puntos[$ 3] = 1;
	niveles_piezas_puntos[$ 6] = 2;
	niveles_piezas_puntos[$ 9] = 3;
	niveles_piezas_puntos[$ 12] = 4;
	niveles_piezas_puntos[$ 15] = 5;

	niveles_piezas_puntos_colocables = {};
	niveles_piezas_puntos_colocables[$ 4] = 1;
	niveles_piezas_puntos_colocables[$ 7] = 2;
	niveles_piezas_puntos_colocables[$ 10] = 3;
	niveles_piezas_puntos_colocables[$ 13] = 4;
	niveles_piezas_puntos_colocables[$ 16] = 5;

	function Coloca_pieza_negra()
	{
		var _encontrado = false;
		var _posicion = 0;
		while !(_encontrado)
		{
			_posicion = irandom_range(1,48);
			if !(struct_exists(obj_tablero.tablero,_posicion))
				_encontrado = true;
		}
		borrar = _posicion;

		obj_tablero.tablero[$ _posicion] = new obj_tablero.pieza(_posicion,TIPO_PIEZA.NEGRO,0);				
	};

	function Limpieza_piezas_negras()
	{
		for (var _i = 1; _i <= 48; _i++)
		{
			if (struct_exists(obj_tablero.tablero,_i) && obj_tablero.tablero[$ _i].tipo == TIPO_PIEZA.NEGRO)
				struct_remove(obj_tablero.tablero,_i);
		}
	};

	function Coloca_pieza_puntos()
	{
		var _encontrado = false;
		var _posicion = 0;
		while !(_encontrado)
		{
			_posicion = irandom_range(1,48);
			if !(struct_exists(obj_tablero.tablero,_posicion))
				_encontrado = true;
		}
		borrar = _posicion;

		obj_tablero.tablero[$ _posicion] = new obj_tablero.pieza(_posicion,TIPO_PIEZA.PUNTOS,choose(0,270));
		obj_tablero.tablero[$ _posicion].puntos = obj_puntos.piezas_especiales;
	};

	function Comprueba_nivel(_nivel)
	{
		// PIEZAS NEGRAS
		var _numero = niveles_piezas_negras[$ obj_game.nivel];
		if (_numero <> undefined)
		{
			Limpieza_piezas_negras();
			for (var _i = 1; _i <= _numero; _i++)
				Coloca_pieza_negra();
		}
	}
}
catch( _exception)
{
	show_message("Error en obj_niveles.create: "+_exception.longMessage);
}