/// @description 

try
{
	menu = {};
	opcion = function(_texto) constructor
	{
		texto = _texto;
	};
	
	menu[$ "1"] =  new opcion("Continue");
	menu[$ "2"] =  new opcion("Audio");
					menu[$ "2"].dentro = false;
					menu[$ "2"].submenu = {};
					menu[$ "2"].submenu[$ "1"] = new opcion("Music");
					menu[$ "2"].submenu[$ "2"] = new opcion("Sound");
					menu[$ "2"].submenu[$ "3"] = new opcion("Back");
	menu[$ "3"] =  new opcion("Quit");
	
	opcion_actual = 1;
	usa_raton = false;
}
catch (_exception)
{
	show_message("Error en obj_menuescape.Create:\n"+_exception.longMessage);
}