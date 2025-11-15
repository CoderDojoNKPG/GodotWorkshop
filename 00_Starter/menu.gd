extends Control

const GAME = preload("res://main.tscn")
var main_scene

func _on_StartButton_pressed():
	main_scene = GAME.instantiate()
	add_child(main_scene)
