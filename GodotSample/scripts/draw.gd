extends Node2D

var is_hovering := false

func _process(_delta):
	if is_hovering:
		queue_redraw()

func _draw():
	if is_hovering:
		draw_circle(Vector2(0,0), 60, Color(0.739, 0.007, 0.173, 0.5),false)
		draw_circle(get_local_mouse_position(),60,Color(0.739, 0.007, 0.173, 1),false)
		draw_circle(get_local_mouse_position(),10,Color(0.739, 0.007, 0.173, 1),false)
		draw_circle(get_local_mouse_position(),5,Color(0.739, 0.007, 0.173, 1),false)
