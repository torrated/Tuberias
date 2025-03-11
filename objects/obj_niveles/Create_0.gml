/// @description 

ejecutado = false;
recurrente = false;
borrar = 0;
niveles_piezas_negras = {};
niveles_piezas_negras[$ 2] = 1;
niveles_piezas_negras[$ 4] = 2;
niveles_piezas_negras[$ 6] = 3;
niveles_piezas_negras[$ 8] = 4;

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

function Comprueba_nivel(_nivel)
{
	var _numero = niveles_piezas_negras[$ obj_game.nivel];
	if (_numero <> undefined)
	{
		Limpieza_piezas_negras();
		for (var _i = 1; _i <= _numero; _i++)
			Coloca_pieza_negra();
	}
}