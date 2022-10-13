# Gestisce le informazioni 7e8

extends Area2D

var letto = 0

func _on_Informazioni7e8_body_entered(body):
	if VitaminaB1Stats.barB1 >= VitaminaB1Stats.max_barB1 and VitaminaB2Stats.barB2 >= VitaminaB2Stats.max_barB2:
		if letto == 0:
			Punteggi.punteggio3 += 10
			letto = 1
		$Inf7e8/Informazioni7e8.visible = true
		Punteggi.visto7e8 = 1
		Punteggi.informazioni3 = 1
		if Punteggi.visto5e6 == 1:
			Punteggi.informazioni3 = 2
