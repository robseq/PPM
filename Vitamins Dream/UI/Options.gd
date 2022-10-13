# Gestisce le opzioni del menu principale

extends Control

func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().change_scene("res://UI/Menu.tscn")

func _on_CheckButton2_toggled(on):
	if on:
		MenuMusic.stream_paused = false
		ControlliAudio.pressed = 0
	else:
		MenuMusic.stream_paused = true
		ControlliAudio.pressed = 1


func _on_CheckButton_toggled(on):
	if on:
		OS.window_fullscreen = true
		ControlliAudio.pressed2 = 1
	else:
		OS.window_fullscreen = false
		ControlliAudio.pressed2 = 0


