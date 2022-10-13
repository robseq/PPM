# Gestisce il punteggio del livello 3

extends Control

var punteggio = Punteggi
var informazioni = Punteggi

onready var label4 = $Punteggio
onready var label5 = $Informazioni

func _process(delta):
	label4.text = "Punti = " + str(punteggio.punteggio3)
	label5.text = str(informazioni.informazioni3) + "/2"

