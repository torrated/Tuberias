/// @description
try
{
	if !(obj_game.estado == ESTADO_JUEGO.NORMAL || obj_game.estado == ESTADO_JUEGO.DESTRUYENDO)
		alarm[0] = velocidad;
	else
	{
		if (distancia > 0) // rellenando
		{
			distancia -= velocidad_movimiento;
			x += dir_x * velocidad_movimiento;
			y += dir_y * velocidad_movimiento;
			if (velocidad_movimiento == 1)
				obj_puntos.puntos += obj_puntos.puntos_normal;
			else
				obj_puntos.puntos += obj_puntos.puntos_extra;
			obj_tablero.tablero[$ posicion].rellena = true;
		}
		else 
		{
			if (test_borde) // fin de pieza
			{
				if (dir_x == 1)
					if (struct_exists(obj_tablero.tablero,posicion+1))
					{
						switch(obj_tablero.tablero[$ posicion+1].tipo)
						{
							case TIPO_PIEZA.CRUCE:	obj_tablero.tablero[$ posicion].rellena = true;
													obj_tablero.tablero[$ posicion+1].cruce_doble += 1;
													posicion += 1;
													break;
							case TIPO_PIEZA.PUNTOS:
							case TIPO_PIEZA.RECTA:	if (obj_tablero.tablero[$ posicion+1].rotacion == 90 || obj_tablero.tablero[$ posicion+1].rotacion == 270)
													{	obj_tablero.tablero[$ posicion].rellena = true; 
														posicion += 1; 
														break;
													}
													else
													{
														obj_game.estado = ESTADO_JUEGO.RECUENTO;
														break;
													}
							case TIPO_PIEZA.CURVA:	if (obj_tablero.tablero[$ posicion+1].rotacion == 0)
													{	obj_tablero.tablero[$ posicion].rellena = true; 
														posicion += 1;
														break;
													}
													else if (obj_tablero.tablero[$ posicion+1].rotacion == 270)
													{	obj_tablero.tablero[$ posicion].rellena = true; 
													    posicion += 1; 
														break;
													}
													else
													{
														obj_game.estado = ESTADO_JUEGO.RECUENTO; 
														break; 
													}
							default: {
										obj_game.estado = ESTADO_JUEGO.RECUENTO; 
										break; 
									 }
						}
					}
					else
					{
						obj_game.estado = ESTADO_JUEGO.RECUENTO;
					}
		
				if (dir_x == -1)
					if (struct_exists(obj_tablero.tablero,posicion-1))
					{
						switch(obj_tablero.tablero[$ posicion-1].tipo)
						{
							case TIPO_PIEZA.CRUCE:	obj_tablero.tablero[$ posicion].rellena = true; 
													obj_tablero.tablero[$ posicion-1].cruce_doble += 1;
													posicion -= 1; 
													break;
							case TIPO_PIEZA.PUNTOS:
							case TIPO_PIEZA.RECTA:	if (obj_tablero.tablero[$ posicion-1].rotacion == 90 || obj_tablero.tablero[$ posicion-1].rotacion == 270)
													{	obj_tablero.tablero[$ posicion].rellena = true; 
														posicion -= 1; 
														break;
													}
													else
													{	
														obj_game.estado = ESTADO_JUEGO.RECUENTO; 
														break; 
													}
							case TIPO_PIEZA.CURVA:	if (obj_tablero.tablero[$ posicion-1].rotacion == 90)
													{ obj_tablero.tablero[$ posicion].rellena = true; 
														posicion -= 1; 
														break; 
													}
													else if (obj_tablero.tablero[$ posicion-1].rotacion == 180)
													{	obj_tablero.tablero[$ posicion].rellena = true; 
														posicion -= 1; 
														break; 
													}
													else
													{	
														obj_game.estado = ESTADO_JUEGO.RECUENTO; 
														break; 
													}
							default: {
										obj_game.estado = ESTADO_JUEGO.RECUENTO; 
										break; 
									 }
						}
					}
					else
					{
						obj_game.estado = ESTADO_JUEGO.RECUENTO;
					}
		
				if (dir_y == 1)
					if (struct_exists(obj_tablero.tablero,posicion+8))
					{
						switch(obj_tablero.tablero[$ posicion+8].tipo)
							{
								case TIPO_PIEZA.CRUCE:	obj_tablero.tablero[$ posicion].rellena = true; 
														obj_tablero.tablero[$ posicion+8].cruce_doble += 1;
														posicion += 8; 
														break;
								case TIPO_PIEZA.PUNTOS:
								case TIPO_PIEZA.RECTA:	if (obj_tablero.tablero[$ posicion+8].rotacion == 0 || obj_tablero.tablero[$ posicion+8].rotacion == 180)
														{   obj_tablero.tablero[$ posicion].rellena = true; 
															posicion += 8; 
															break; 
														}
														else
														{	
															obj_game.estado = ESTADO_JUEGO.RECUENTO; 
															break; 
														}
								case TIPO_PIEZA.CURVA:	if (obj_tablero.tablero[$ posicion+8].rotacion == 180)
													{	obj_tablero.tablero[$ posicion].rellena = true; 
														posicion += 8; 
														break; 
													}
													else if (obj_tablero.tablero[$ posicion+8].rotacion == 270)
													{	obj_tablero.tablero[$ posicion].rellena = true; 
														posicion += 8; 
														break; 
													}
													else
													{	
														obj_game.estado = ESTADO_JUEGO.RECUENTO; 
														break; 
													}
								default: {
										obj_game.estado = ESTADO_JUEGO.RECUENTO; 
										break; 
										}
							}
					}
					else
					{
						obj_game.estado = ESTADO_JUEGO.RECUENTO;
					}
		
				if (dir_y == -1)
					if (struct_exists(obj_tablero.tablero,posicion-8))
					{
						switch(obj_tablero.tablero[$ posicion-8].tipo)
							{
								case TIPO_PIEZA.CRUCE:	obj_tablero.tablero[$ posicion].rellena = true; 
														obj_tablero.tablero[$ posicion-8].cruce_doble += 1;
														posicion -= 8; 
														break;
								case TIPO_PIEZA.PUNTOS:
								case TIPO_PIEZA.RECTA:	if (obj_tablero.tablero[$ posicion-8].rotacion == 0 || obj_tablero.tablero[$ posicion-8].rotacion == 180)
														{	obj_tablero.tablero[$ posicion].rellena = 1; 
															posicion -= 8; 
															break; 
														}
														else
														{	
															obj_game.estado = ESTADO_JUEGO.RECUENTO; 
															break; 
														}
								case TIPO_PIEZA.CURVA:	if (obj_tablero.tablero[$ posicion-8].rotacion == 0)
														{	obj_tablero.tablero[$ posicion].rellena = true; 
															posicion -= 8; 
															break; 
														}
														else if (obj_tablero.tablero[$ posicion-8].rotacion == 90)
														{	obj_tablero.tablero[$ posicion].rellena = true; 
															posicion -= 8; 
															break; 
														}
														else
														{	
															obj_game.estado = ESTADO_JUEGO.RECUENTO; 
															break; 
														}
								default: {
										obj_game.estado = ESTADO_JUEGO.RECUENTO; 
										break; 
									 }
							}
					}
					else
					{
						obj_game.estado = ESTADO_JUEGO.RECUENTO;
					}
		
				test_borde = false;
			}
			else//aqui comprobamos giros a mitad de pieza
			{
				test_borde = true;
				if (dir_x == 1)
				{
					switch(obj_tablero.tablero[$ posicion].tipo)
					{
						case TIPO_PIEZA.CRUCE:	break;
						case TIPO_PIEZA.PUNTOS:
						case TIPO_PIEZA.RECTA:	if (obj_tablero.tablero[$ posicion].rotacion == 90 || obj_tablero.tablero[$ posicion].rotacion == 270)
													{ break; }
												else
													{ obj_game.estado = ESTADO_JUEGO.RECUENTO; break; }
						case TIPO_PIEZA.CURVA:	if (obj_tablero.tablero[$ posicion].rotacion == 0)
													{ dir_x = 0; dir_y = 1; break; }
												else if (obj_tablero.tablero[$ posicion].rotacion == 270)
													{ dir_x = 0; dir_y = -1; break; }
												else
													{ obj_game.estado = ESTADO_JUEGO.RECUENTO; break; }
					}
				}
				else if (dir_x == -1)
					{
						switch(obj_tablero.tablero[$ posicion].tipo)
						{
							case TIPO_PIEZA.CRUCE:	break;
							case TIPO_PIEZA.PUNTOS:
							case TIPO_PIEZA.RECTA:	if (obj_tablero.tablero[$ posicion].rotacion == 90 || obj_tablero.tablero[$ posicion].rotacion == 270)
														{ break; }
													else
														{ obj_game.estado = ESTADO_JUEGO.RECUENTO; break; }
							case TIPO_PIEZA.CURVA:	if (obj_tablero.tablero[$ posicion].rotacion == 90)
														{ dir_x = 0; dir_y = 1; break; }
													else if (obj_tablero.tablero[$ posicion].rotacion == 180)
														{ dir_x = 0; dir_y = -1; break; }
													else
														{ obj_game.estado = ESTADO_JUEGO.RECUENTO; break; }
						}
					}
					else if (dir_y == 1)
						{
							switch(obj_tablero.tablero[$ posicion].tipo)
							{
								case TIPO_PIEZA.CRUCE:	break;
								case TIPO_PIEZA.PUNTOS:
								case TIPO_PIEZA.RECTA:	if (obj_tablero.tablero[$ posicion].rotacion == 0 || obj_tablero.tablero[$ posicion].rotacion == 180)
															{ break; }
														else
															{ obj_game.estado = ESTADO_JUEGO.RECUENTO; break; }
								case TIPO_PIEZA.CURVA:	if (obj_tablero.tablero[$ posicion].rotacion == 180)
															{ dir_x = 1; dir_y = 0; break; }
														else if (obj_tablero.tablero[$ posicion].rotacion == 270)
															{ dir_x = -1; dir_y = 0; break; }
														else
															{ obj_game.estado = ESTADO_JUEGO.RECUENTO; break; }
							}
						}
						else //dir_y == -1
						{
							switch(obj_tablero.tablero[$ posicion].tipo)
							{
								case TIPO_PIEZA.CRUCE:	break;
								case TIPO_PIEZA.PUNTOS:
								case TIPO_PIEZA.RECTA:	if (obj_tablero.tablero[$ posicion].rotacion == 0 || obj_tablero.tablero[$ posicion].rotacion == 180)
															{ break; }
														else
															{ obj_game.estado = ESTADO_JUEGO.RECUENTO; break; }
								case TIPO_PIEZA.CURVA:	if (obj_tablero.tablero[$ posicion].rotacion == 0)
															{ dir_x = -1; dir_y = 0; break; }
														else if (obj_tablero.tablero[$ posicion].rotacion == 90)
															{ dir_x = 1; dir_y = 0; break; }
														else
															{ obj_game.estado = ESTADO_JUEGO.RECUENTO; break; }
							}
						}
			}
	
			distancia = distancia_maxima;
		}
		alarm[0] = velocidad;
	}
}
catch( _exception)
{
	show_message("Error en obj_agua.alarm0: "+_exception.longMessage);
}