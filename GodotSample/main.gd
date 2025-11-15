extends Node2D
@onready var player = get_node("Player")
@onready var label = get_node("DebugLabel")
@onready var anim = get_node("AnimationPlayer")

var player_speed = 400
const w = 1920
const h = 1080
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
	if event is InputEventMouseMotion:
		pass

func _process(delta):
	if not game_over:
		if pressed:
			pressed_position = get_global_mouse_position()
			
		player.position  = player.position.move_toward(pressed_position, delta * player_speed)
	# sprite.position.x  = move_toward(sprite.position.x, pressed_position.x, 10)
	# sprite.position.y  = move_toward(sprite.position.y, pressed_position.y, 10)

func damage_taken():
	anim.play("player_anim")
	player.hp -= 1
	update_label()
	if player.hp <= 0:
		label.text = str("Game Over")
		game_over = true
		
func update_label():
	label.text = "HP: " + str(player.hp) + " BULLETS: " + str(player.no_bullets)
