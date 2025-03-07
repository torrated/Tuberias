/// @description 

if !(surface_exists(surf))
{
	surf = surface_create(room_width,room_height);
	surface_set_target(surf);
	surface_reset_target();
}

with (obj_agua)
{
	surface_set_target(other.surf);
	draw_sprite(spr_agua,0,x,y);
	surface_reset_target();
	draw_surface(other.surf,0,0);
}