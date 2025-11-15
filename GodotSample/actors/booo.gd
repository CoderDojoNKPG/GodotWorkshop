extends Area2D

var goal = Vector2.ZERO
var speed = 100

@onready var main = $"../.."
@onready var player = $"../../Player"

func _process(delta):
	if not main.game_over:
		position  = position.move_toward(goal, delta * speed)
	if position == goal:
		goal = $"../../Player".position

func _on_Booo_area_entered(area):
	if area.name == 'Player':
		main.damage_taken()

func pass_player_pos(vec):
	goal = vec
	
func remove_me():
	call_deferred('queue_free')
	
func _on_ColorRect_gui_input(event):
	if event is InputEventMouseButton:
		if event.pressed == true:
			player.launch_bullet(self)
