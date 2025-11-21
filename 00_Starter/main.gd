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
			

		
func update_label():
	label.text = "HP: " + str(player.hp) + " BULLETS: " + str(player.no_bullets)
