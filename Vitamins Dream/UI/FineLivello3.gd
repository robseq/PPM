# Scritta fine livello 3

extends Control

onready var label = $Label

func _process(delta):
	label.text = str(Punteggi.punteggio3)
