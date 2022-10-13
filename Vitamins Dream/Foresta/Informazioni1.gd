# Gestisce le informazioni 1

extends Area2D

var letto = 0

func _on_Informazioni1_body_entered(body):
	if VitaminaAStats.barA >= VitaminaAStats.max_barA:
		if letto == 0:
			Punteggi.punteggio += 10
			letto = 1
		$Inf1/Informazioni1.visible = true
		Punteggi.visto1 = 1
		Punteggi.informazioni = 1
		if Punteggi.visto2 == 1:
			Punteggi.informazioni = 2
		

func _on_Chiudi_pressed():
	$Inf1/Informazioni1/Inf1.visible = false
	$Inf1/Informazioni1/Inf2.visible = true
	






