# Gestisce il punteggio del livello 1

extends Control

var punteggio = Punteggi
var informazioni = Punteggi

onready var label = $Punteggio
onready var label1 = $Informazioni

func _process(delta):
	label.text = "Punti = " + str(punteggio.punteggio)
	label1.text = str(informazioni.informazioni) + "/2"

