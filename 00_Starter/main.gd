extends Node2D
@onready var player = get_node("Player")
@onready var label = get_node("DebugLabel")
@onready var anim = get_node("AnimationPlayer")

var player_speed = 400
const w = 960
const h = 540
var pressed = false
var pressed_position = Vector2(w/2,h/2)
var game_over = false

func _ready():
	update_label()

func _on_ColorRect_gui_input(event):
	if event is InputEventMouseButton:
		if event.pressed == true:
			pressed = true
		elif event.pressed == false:
			pressed = false

func _process(_delta):
	if not game_over:
		if pressed:
			player.goto = get_global_mouse_position()
			

func damage_taken():
	# När spelaren tar skada visar vi detta med en liten animation
	anim.play("player_anim")
	# Och drar ifrån ett poäng ifrån spelarens hälsa
	player.hp -= 1
	# Därefter behöver vi uppdatera texten så man ser hur mycket hälsa man har
	update_label()
	# Om hälsan blir noll är spelet över
	if player.hp <= 0:
		label.text = str("Game Over")
		game_over = true
		
func update_label():
	label.text = "HP: " + str(player.hp) + " BULLETS: " + str(player.no_bullets)
