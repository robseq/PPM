# Gestisce il terzo livello

extends Node2D

func _ready():
	get_tree().paused = false

func _process(delta):
	if PlayerStats.health == 0:      #se il giocatore muore si resetta il livello
		get_tree().change_scene("res://Foresta/Livello3.tscn")
		PlayerStats.health = 4
		Punteggi.punteggio3 = 0
		Punteggi.informazioni3 = 0
		VitaminaB1Stats.barB1 = 0
		VitaminaB2Stats.barB2 = 0
	
	if VitaminaB1Stats.barB1 == VitaminaB1Stats.max_barB1 and VitaminaB2Stats.barB2 == VitaminaB2Stats.max_barB2:    #se la barra della vitamina si riempie compaiono le informazioni
		$Informazioni5e6.visible = true
		$Informazioni7e8.visible = true
		
	if ControlliAudio.pressed == 1:
		BackMusic.stream_paused = true
		$Pausa/Pausa/CanvasLayer3/Options/CheckButton3.pressed = false

func _on_Riprendi_pressed():  #se il giocatore clicca Riprendi nel menù, quest ultimo sparisce
	get_tree().paused = false   #e viene tolta la pausa
	if ControlliAudio.pressed == 1:
		BackMusic.stream_paused = true
	$Pausa/Pausa.visible = false
	$CanvasLayer/BottonePausa.visible = true

#INFOCOMANDI

func _on_BottoneSuggerimenti_pressed():     #se clicca Suggerimenti si apre la schermata dei suggerimenti
	$Suggerimento/InfoComandi.visible = true

func _on_Indietro_pressed():                   #se clicca Indietro nella schermata dei suggerimenti questi ultimi spariscono
	$Suggerimento/InfoComandi.visible = false

#FINE

func _on_CambioScena_body_entered(body):           #se il giocatore entra nell'area del cambio scena si passa alla scena successiva
	if Punteggi.punteggio3 >= 100 and Punteggi.informazioni3 == 2:
		$CanvasLayer2/FineLivello3.visible = true
	elif Punteggi.punteggio3 < 100 and Punteggi.informazioni3 == 2:
		$CanvasLayer2/ObiettivoNonRaggiunto3.visible = true
	elif Punteggi.punteggio3 >= 100 and Punteggi.informazioni3 < 2:
		$CanvasLayer2/ObiettivoNonRaggiunto3.visible = true
	else:
		$CanvasLayer2/ObiettivoNonRaggiunto3.visible = true

func _on_BottonePausa_pressed():
	$Pausa/Pausa.visible = true
	get_tree().paused = true

func _on_Ok_pressed():
	$CanvasLayer2/Livello3Inf.visible = false

func _on_Button_pressed():
	$CanvasLayer2/ObiettivoNonRaggiunto3.visible = false

func _on_Button2_pressed(): 
	get_tree().change_scene("res://Foresta/Livello3.tscn")
	PlayerStats.health = 4
	Punteggi.punteggio3 = 0
	Punteggi.informazioni3 = 0
	VitaminaB1Stats.barB1 = 0
	VitaminaB2Stats.barB2 = 0

#QUIZ

func _on_Ok2_pressed():
	$CanvasLayer2/FineLivello3.visible = false
	$CanvasLayer2/Quiz3.visible = true

func _on_Prosegui3_pressed():
	get_tree().change_scene("res://Casa/CasaFine.tscn")

func _on_Prosegui5_pressed():
	get_tree().change_scene("res://Casa/CasaFine.tscn")

func _on_Prosegui4_pressed():
	get_tree().change_scene("res://Casa/CasaFine.tscn")

#INFORMAZIONI

func _on_Chiudi10_pressed():
	$Informazioni5e6/Inf5e6/Informazioni5e6/Inf6.visible = false
	$Informazioni5e6/Inf5e6/Informazioni5e6/Inf5.visible = true
	$Informazioni5e6/Inf5e6/Informazioni5e6.visible = false
	

func _on_Chiudi7_pressed():
	$Informazioni7e8/Inf7e8/Informazioni7e8/Informazioni8.visible = false
	$Informazioni7e8/Inf7e8/Informazioni7e8/Informazioni7.visible = true
	$Informazioni7e8/Inf7e8/Informazioni7e8.visible = false
	
