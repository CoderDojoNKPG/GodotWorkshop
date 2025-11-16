extends Area2D

var goal = Vector2.ZERO
var speed = 100

@onready var main = $"../.."
@onready var player = $"../../Player"
@onready var drawer = $Draw

func _ready() -> void:
	drawer.set_process(false)

func _process(delta):
	# Flytta endast om spelet inte är förlorat
	if not main.game_over:
		position  = position.move_toward(goal, delta * speed)

	# När målet är nått hämta spelarens position
	if position == goal:
		goal = $"../../Player".position

func _on_Booo_area_entered(area):
	if area.name == 'Player':
		player.damage_taken()

func pass_player_pos(vec):
	goal = vec
	
func remove_me():
	call_deferred('queue_free')
	
func _on_ColorRect_gui_input(event):
	if event is InputEventMouseButton:
		if event.pressed == true:
			player.launch_bullet(self)


func _on_color_rect_mouse_entered() -> void:
	drawer.is_hovering = true
	drawer.set_process(true)


func _on_color_rect_mouse_exited() -> void:
	drawer.is_hovering = false
	drawer.set_process(false)
	drawer.queue_redraw()
	
