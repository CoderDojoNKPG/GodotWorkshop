extends Area2D

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
	pass
