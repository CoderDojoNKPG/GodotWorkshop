extends Node2D
var index = 0
@onready var first_booo = $"../Booos".get_child(0)


func _process(delta):
	if index == 0:
		queue_redraw()
	else:
		index += 1
		if index > 600:
			index == 0

func _draw():
	var blue : Color = Color(0,0,1,0.5)
	draw_circle(get_global_mouse_position(),60,blue,false)
#	if is_instance_valid(first_booo):
#		draw_arc(first_booo.position, 50, 0, 2 * PI, 64, red, 0.5)
#	else:
#		get_first_booo()

func get_first_booo():
	first_booo = $"../Booos".get_child(0)
