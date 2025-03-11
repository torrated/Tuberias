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
	draw_sprite_ext(spr_agua,0,x,y,1,1,random_range(0,359),c_white,1);
	//draw_sprite(spr_agua,0,x,y);
	surface_reset_target();
	draw_surface(other.surf,0,0);
}