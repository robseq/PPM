# Gestisce le informazioni 2

extends Area2D

var letto = 0

func _on_Informazioni2_body_entered(body):
	if VitaminaAStats.barA >= VitaminaAStats.max_barA:
		if letto == 0:
			Punteggi.punteggio += 10
			letto = 1
		$Inf2/Informazioni2.visible = true
		Punteggi.visto2 = 1
		Punteggi.informazioni = 1
		if Punteggi.visto1 == 1:
			Punteggi.informazioni = 2


func _on_Chiudi12_pressed():
	$Inf2/Informazioni2/Testo.visible = false
	$Inf2/Informazioni2/Immagine.visible = true
