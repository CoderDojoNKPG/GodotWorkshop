extends Node2D
const w = 1920
const h = 1080

var pick_scene: PackedScene = preload("res://actors/pick.tscn")

func create_pick():
	var instance = pick_scene.instantiate()
	randomize()
	var rand_w = randi() % w
	var rand_h = randi() % h
	instance.position = Vector2(rand_w , rand_h)
	add_child(instance)

func _on_timer_timeout() -> void:
	create_pick()
