# Gestisce il dialogo e la musica finale

extends Node2D

func _ready():
	BackMusic.stop()
	get_tree().paused = true
	var dialog = Dialogic.start('dialogoFinale')
	dialog.pause_mode = Node.PAUSE_MODE_PROCESS
	dialog.connect('timeline_end', self, 'unpause')
	add_child(dialog)

func unpause(timeline_name):   #toglie la pausa quando termina il dialogo
	get_tree().paused = false
	get_tree().change_scene("res://UI/Menu.tscn")

func _process(delta):   
	MenuMusic.stop()
	BackMusic.stream_paused = true



