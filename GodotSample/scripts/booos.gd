extends Node2D
const w = 1920
const h = 1080
var booo_scene: PackedScene = preload("res://actors/booo.tscn")
@onready var player = get_node("../Player")
	
func create_booo():
	# Skapar en fiende som spawnas till scenen på slumpad postition
	var instance = booo_scene.instantiate()
	randomize()
	var rand_w = randi() % w
	var rand_h = randi() % h
	print(rand_w, " ", rand_h)
	instance.position = Vector2(rand_w , rand_h)
	instance.pass_player_pos(player.position)
	add_child(instance)

func _on_timer_timeout() -> void:
	create_booo()
