# Gestisce il punteggio del livello 2

extends Control

var punteggio = Punteggi
var informazioni = Punteggi

onready var label2 = $Punteggio
onready var label3 = $Informazioni

func _process(delta):
	label2.text = "Punti = " + str(punteggio.punteggio2)
	label3.text = str(informazioni.informazioni2) + "/2"

