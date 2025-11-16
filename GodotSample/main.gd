extends Node2D
@onready var player = get_node("Player")
@onready var label = get_node("DebugLabel")

const width = 1920
const height = 1080
const half_width = int(round(width/2.0))
const half_height = int(round(height/2.0))

var pressed = false
var game_over = false

func _ready():
	player.goto = Vector2(half_width,half_height)
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
			# player.position  = player.position.move_toward(pressed_position, delta * player_speed)
	elif game_over and pressed:
		call_deferred('queue_free')
	elif game_over:
		stop_spawn_timers()

		
func update_label():
	label.text = "HÄLSA: " + str(player.hp) + " PROJEKTILER: " + str(player.no_bullets)

func stop_spawn_timers():
	$Picks/Timer.stop()
	$Booos/Timer.stop()

func summary():
	label.text = "Game Over spelet är slut \n Klicka var som helst för att återgå till startmenyn!"
