# Gestisce il dialogo iniziale

extends Node2D

func _ready():
	MenuMusic.stop()
	var dialog = Dialogic.start('inizio')
	dialog.pause_mode = Node.PAUSE_MODE_PROCESS
	dialog.connect('timeline_end', self, 'unpause')
	add_child(dialog)

func unpause(timeline_name):   #toglie la pausa quando termina il dialogo
	get_tree().paused = false
	get_tree().change_scene("res://Foresta/Livello1.tscn")
