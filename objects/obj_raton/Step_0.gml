/// @description 

if !(obj_game.estado == ESTADO_JUEGO.NORMAL) exit;

var _colocable = false;

if (mouse_check_button_pressed(mb_left))
{
	// coger la pieza siguiente
	if (mouse_x >= obj_tablero.siguientes[$ 4]._x - 48
		&& mouse_x <= obj_tablero.siguientes[$ 4]._x + 48
		&& mouse_y >= obj_tablero.siguientes[$ 4]._y - 48
		&& mouse_y <= obj_tablero.siguientes[$ 4]._y + 48
		)
	{
		pieza = obj_tablero.siguientes[$ 4];
		with (obj_tablero)
		{
			Sacar_una_pieza();
		}
	}
	else if (struct_exists(pieza,"_x")) //colocar pieza
	{
		var _posicion = int64(mouse_x/96) + (8* (int64(mouse_y/96)-1));
		if (struct_exists(obj_tablero.tablero,_posicion))
		{
			if (obj_tablero.tablero[$ _posicion].tipo <> TIPO_PIEZA.START)
			{
				_colocable = true;
				obj_game.estado = ESTADO_JUEGO.DESTRUYENDO;
				obj_game.alarm[1]= obj_game.penalizacion_destruccion;
			}
		}
		else
		{
			_colocable = true;
		}
		
		if (_colocable)
		{
			obj_tablero.tablero[$ _posicion] = new obj_tablero.pieza(_posicion,pieza.tipo,pieza.rotacion);
			pieza = {};
			if (obj_game.estado == ESTADO_JUEGO.DESTRUYENDO)
				var _penalizacion = instance_create_layer(obj_tablero.tablero[$ _posicion]._x,obj_tablero.tablero[$ _posicion]._y,"Penalizacion",obj_penalizacion);
		}
	}
}