extends Area2D

@onready var main = get_node("/root/Main")
@onready var bullets = get_node("../Bullets")

var hp = 10
var no_bullets = 0
var goto = Vector2.ZERO
@export var speed = 400

func _process(delta: float) -> void:
	position  = position.move_toward(goto, delta * speed)


func add_bullet():
	no_bullets += 1
	$"..".update_label()


func sub_bullet():
	no_bullets -= 1
	$"..".update_label()


func launch_bullet(ins):
	# ATT GÖRA: Instansiera en projektil
	pass
