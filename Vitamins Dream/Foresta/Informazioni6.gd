# Gestisce le informazioni 6

extends Area2D

func _on_Informazioni6_body_entered(body):
	if VitaminaB1Stats.barB1 >= VitaminaB1Stats.max_barB1 and VitaminaB2Stats.barB2 >= VitaminaB2Stats.max_barB2:
		$Inf7e8/Informazioni7e8.visible = true
		Punteggi.visto7e8 = 1
		Punteggi.informazioni3 = 1
		if Punteggi.visto5e6 == 1:
			Punteggi.informazioni3 = 2

func _on_Chiudi7_pressed():
	$Inf7e8/Informazioni7e8.visible = false
