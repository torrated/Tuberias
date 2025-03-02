/// @description 

//obj_tablero.Inicializar();
var _posicion = irandom_range(1,48);
obj_tablero.tablero[$ _posicion] = new obj_tablero.pieza(_posicion,choose(1,2,3),choose(0,90,180,270));