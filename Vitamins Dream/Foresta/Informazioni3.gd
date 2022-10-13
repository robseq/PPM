# Gestisce le informazioni 3

extends Area2D

var letto = 0

func _on_Informazioni3_body_entered(body):
	if VitaminaB12Stats.barB12 >= VitaminaB12Stats.max_barB12:
		if letto == 0:
			Punteggi.punteggio2 += 10
			letto = 1
		$Inf3/Informazioni3.visible = true
		Punteggi.visto3 = 1
		Punteggi.informazioni2 = 1
		if Punteggi.visto4 == 1:
			Punteggi.informazioni2 = 2

func _on_Chiudi3_pressed():
	$Inf3/Informazioni3.visible = false
