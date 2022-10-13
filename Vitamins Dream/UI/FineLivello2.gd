# Scritta fine livello 2

extends Control

onready var label = $Label

func _process(delta):
	label.text = str(Punteggi.punteggio2)
