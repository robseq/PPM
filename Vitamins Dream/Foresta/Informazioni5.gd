# Gestisce le informazioni 5

extends Area2D

var letto = 0

func _on_Informazioni5e6_body_entered(body):
	if VitaminaB1Stats.barB1 >= VitaminaB1Stats.max_barB1 and VitaminaB2Stats.barB2 >= VitaminaB2Stats.max_barB2:
		if letto == 0:
			Punteggi.punteggio3 += 10
			letto = 1
		$Inf5e6/Informazioni5e6.visible = true
		Punteggi.visto5e6 = 1
		Punteggi.informazioni3 = 1
		if Punteggi.visto7e8 == 1:
			Punteggi.informazioni3 = 2
	
