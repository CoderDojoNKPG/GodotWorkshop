extends Area2D
var bullet_scene: PackedScene = preload("res://actors/bullet.tscn")
@onready var bullets = get_node("../Bullets")

var hp = 10
var no_bullets = 0

func add_bullet():
	no_bullets += 1
	$"..".update_label()

func sub_bullet():
	no_bullets -= 1
	$"..".update_label()

func launch_bullet(ins):
	if no_bullets > 0:
		var instance = bullet_scene.instantiate()
		instance.position = position
		instance.pass_bullet_instance(ins)
		bullets.add_child(instance)
		print("PANG" +  str(ins.name))
		sub_bullet()
