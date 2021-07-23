/// @description Insert description here
// You can write your code in this editor
if (isHit == false) {
	draw_self();
}

if isHit {
	gpu_set_fog(true,c_white,0,0);
	draw_self();
	gpu_set_fog(false,c_white,0,0);
}