extends Area2D

func _ready():
	pass # Replace with function body.

func _on_Pick_area_entered(area):
	if area.name == 'Player':
		call_deferred('queue_free')
		$"../../Player".add_bullet()
		$"../..".update_label()
