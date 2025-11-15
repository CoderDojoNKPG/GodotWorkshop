extends Area2D

var goal = Vector2.ZERO
var speed = 400
var target_instance

func _process(delta):
	position  = position.move_toward(goal, delta * speed)
	if is_instance_valid(target_instance):
		goal = target_instance.position
	else:
		call_deferred('queue_free')

func _on_Booo_area_entered(area):
	if area == target_instance:
		target_instance.call_deferred('queue_free')
		call_deferred('queue_free')

func pass_bullet_instance(ins):
	target_instance = ins
	goal = ins.position
