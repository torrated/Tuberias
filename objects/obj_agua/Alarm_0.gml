/// @description
if (stop) exit;

if (distancia > 0)
{
	distancia -= 1
	x += dir_x;
	y += dir_y;
}
else 
{
	if (test_borde)
	{
		if (dir_x == 1)
			if (struct_exists(obj_tablero.tablero,posicion+1))
			{
				switch(obj_tablero.tablero[$ posicion+1].sprite)
				{
					case spr_cruce: posicion += 1; break;
					case spr_recta: if (obj_tablero.tablero[$ posicion+1].rotacion == 90 || obj_tablero.tablero[$ posicion+1].rotacion == 270)
										{ posicion += 1; break; }
									else
										{ stop = true; break; }
					case spr_curva: if (obj_tablero.tablero[$ posicion+1].rotacion == 0)
										{ posicion += 1; break; }
									else if (obj_tablero.tablero[$ posicion+1].rotacion == 270)
										{ posicion += 1; break; }
									else
										{ stop = true; break; }
				}
			}
			else
				stop = true;
		
		if (dir_x == -1)
			if (struct_exists(obj_tablero.tablero,posicion-1))
			{
				switch(obj_tablero.tablero[$ posicion-1].sprite)
				{
					case spr_cruce: posicion -= 1; break;
					case spr_recta: if (obj_tablero.tablero[$ posicion-1].rotacion == 90 || obj_tablero.tablero[$ posicion-1].rotacion == 270)
										{ posicion -= 1; break; }
									else
										{ stop = true; break; }
					case spr_curva: if (obj_tablero.tablero[$ posicion-1].rotacion == 90)
										{ posicion -= 1; break; }
									else if (obj_tablero.tablero[$ posicion-1].rotacion == 180)
										{ posicion -= 1; break; }
									else
										{ stop = true; break; }
				}
			}
			else
				stop = true;
		
		if (dir_y == 1)
			if (struct_exists(obj_tablero.tablero,posicion+8))
			{
				switch(obj_tablero.tablero[$ posicion+8].sprite)
					{
						case spr_cruce: posicion += 8; break;
						case spr_recta: if (obj_tablero.tablero[$ posicion+8].rotacion == 0 || obj_tablero.tablero[$ posicion+8].rotacion == 180)
											{ posicion += 8; break; }
										else
											{ stop = true; break; }
						case spr_curva: if (obj_tablero.tablero[$ posicion+8].rotacion == 180)
											{ posicion += 8; break; }
										else if (obj_tablero.tablero[$ posicion+8].rotacion == 270)
											{ posicion += 8; break; }
										else
											{ stop = true; break; }
					}
			}
			else
				stop = true;
		
		if (dir_y == -1)
			if (struct_exists(obj_tablero.tablero,posicion-8))
			{
				switch(obj_tablero.tablero[$ posicion-8].sprite)
					{
						case spr_cruce: posicion -= 8; break;
						case spr_recta: if (obj_tablero.tablero[$ posicion-8].rotacion == 0 || obj_tablero.tablero[$ posicion-8].rotacion == 180)
											{ posicion -= 8; break; }
										else
											{ stop = true; break; }
						case spr_curva: if (obj_tablero.tablero[$ posicion-8].rotacion == 0)
											{ posicion -= 8; break; }
										else if (obj_tablero.tablero[$ posicion-8].rotacion == 90)
											{ posicion -= 8; break; }
										else
											{ stop = true; break; }
					}
			}
			else
				stop = true;
		
		test_borde = false;
	}
	else//aqui comprobamos giros
	{
		test_borde = true;
		if (dir_x == 1)
		{
			switch(obj_tablero.tablero[$ posicion].sprite)
			{
				case spr_cruce: break;
				case spr_recta: if (obj_tablero.tablero[$ posicion].rotacion == 90 || obj_tablero.tablero[$ posicion].rotacion == 270)
									{ break; }
								else
									{ stop = true; break; }
				case spr_curva: if (obj_tablero.tablero[$ posicion].rotacion == 0)
									{ dir_x = 0; dir_y = 1; break; }
								else if (obj_tablero.tablero[$ posicion].rotacion == 270)
									{ dir_x = 0; dir_y = -1; break; }
								else
									{ stop = true; break; }
			}
		}
		else if (dir_x == -1)
			{
				switch(obj_tablero.tablero[$ posicion].sprite)
				{
					case spr_cruce: break;
					case spr_recta: if (obj_tablero.tablero[$ posicion].rotacion == 90 || obj_tablero.tablero[$ posicion].rotacion == 270)
										{ break; }
									else
										{ stop = true; break; }
					case spr_curva: if (obj_tablero.tablero[$ posicion].rotacion == 90)
										{ dir_x = 0; dir_y = 1; break; }
									else if (obj_tablero.tablero[$ posicion].rotacion == 180)
										{ dir_x = 0; dir_y = -1; break; }
									else
										{ stop = true; break; }
				}
			}
			else if (dir_y == 1)
				{
					switch(obj_tablero.tablero[$ posicion].sprite)
					{
						case spr_cruce: break;
						case spr_recta: if (obj_tablero.tablero[$ posicion].rotacion == 0 || obj_tablero.tablero[$ posicion].rotacion == 180)
											{ break; }
										else
											{ stop = true; break; }
						case spr_curva: if (obj_tablero.tablero[$ posicion].rotacion == 180)
											{ dir_x = 1; dir_y = 0; break; }
										else if (obj_tablero.tablero[$ posicion].rotacion == 270)
											{ dir_x = -1; dir_y = 0; break; }
										else
											{ stop = true; break; }
					}
				}
				else //dir_y == -1
				{
					switch(obj_tablero.tablero[$ posicion].sprite)
					{
						case spr_cruce: break;
						case spr_recta: if (obj_tablero.tablero[$ posicion].rotacion == 0 || obj_tablero.tablero[$ posicion].rotacion == 180)
											{ break; }
										else
											{ stop = true; break; }
						case spr_curva: if (obj_tablero.tablero[$ posicion].rotacion == 0)
											{ dir_x = -1; dir_y = 0; break; }
										else if (obj_tablero.tablero[$ posicion].rotacion == 90)
											{ dir_x = 1; dir_y = 0; break; }
										else
											{ stop = true; break; }
					}
				}
	}
	
	distancia = distancia_maxima;
}
alarm[0] = velocidad;