# Scritta fine livello 

extends Control

onready var label = $Label

func _process(delta):
	label.text = str(Punteggi.punteggio)
