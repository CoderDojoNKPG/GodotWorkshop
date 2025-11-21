extends Area2D

@onready var main = get_node("/root/Main")
@onready var bullets = get_node("../Bullets")
@onready var anim = get_node("/root/Main/AnimationPlayer")

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


func damage_taken():
	# När spelaren tar skada visar vi detta med en liten animation
	anim.play("player_anim")

	# Och drar ifrån ett poäng ifrån spelarens hälsa
	hp -= 1

	# Därefter behöver vi uppdatera texten så man ser hur mycket hälsa man har
	main.update_label()
	# Om hälsan blir noll är spelet över
	if hp <= 0:
		main.label.text = str("Game Over")
		main.game_over = true
