extends Node2D
var index = 0


func _process(_delta):
	queue_redraw()


func _draw():
	var blue : Color = Color(0,0,1,0.5)
	draw_circle(get_global_mouse_position(),60,blue,false)


func get_first_booo():
	pass
