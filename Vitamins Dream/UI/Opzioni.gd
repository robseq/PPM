# Gestisce le opzioni del menu di pausa

extends Control

func _on_CheckButton3_toggled(on):
	if on:
		MenuMusic.stream_paused = true
		BackMusic.stream_paused = false
		ControlliAudio.pressed = 0
	else:
		MenuMusic.stream_paused = true
		BackMusic.stream_paused = true
		ControlliAudio.pressed = 1
		

func _on_CheckButton_toggled(on):
	if on:
		OS.window_fullscreen = true
		ControlliAudio.pressed2 = 1
	else:
		OS.window_fullscreen = false
		ControlliAudio.pressed2 = 0


