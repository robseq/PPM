# Controlla i bottoni dell'audio

extends CheckButton

func _on_CheckButton3_toggled(on):
	if on:
		MenuMusic.stream_paused = false
		ControlliAudio.press = 0
	else:
		MenuMusic.stream_paused = true
		ControlliAudio.press = 1
		ControlliAudio.allMusic = 1
