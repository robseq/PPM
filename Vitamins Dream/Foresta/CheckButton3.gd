# Controlli le musiche del gioco
extends CheckButton

func _on_CheckButton3_toggled(on):
	if on:
		BackMusic.stream_paused = false
		ControlliAudio.press = 0
		ControlliAudio.allMusic = 0
	else:
		BackMusic.stream_paused = true
		ControlliAudio.press = 1
		ControlliAudio.allMusic = 1
