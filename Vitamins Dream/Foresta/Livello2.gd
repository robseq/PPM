#Gestisce il secondo livello

extends Node2D

var visto = 0

func _ready():
	get_tree().paused = false

func _process(delta):
	if PlayerStats.health == 0:           #se il giocatore muore viene resettato il livello
		get_tree().change_scene("res://Foresta/Livello2.tscn")
		PlayerStats.health = 4
		Punteggi.punteggio2 = 0
		Punteggi.informazioni2 = 0
		VitaminaB12Stats.barB12 = 0

	if VitaminaB12Stats.barB12 == VitaminaB12Stats.max_barB12:       #se la barra della vitamina si riempie compaiono le informazioni
		$Informazioni3.visible = true
		$Informazioni4.visible = true
	
	if ControlliAudio.pressed == 1:
		BackMusic.stream_paused = true
		$CanvasLayer2/Pausa/CanvasLayer3/Options/CheckButton3.pressed = false
		

func _on_Riprendi_pressed():  #se il giocatore clicca Riprendi nel menù, quest ultimo sparisce
	get_tree().paused = false   #e viene tolta la pausa
	if ControlliAudio.pressed == 1:
		BackMusic.stream_paused = true
	$CanvasLayer2/Pausa.visible = false
	$CanvasLayer/BottonePausa.visible = true

#INFOCOMANDI 

func _on_BottoneSuggerimenti_pressed():   #se clicca Suggerimenti si apre la schermata dei suggerimenti
	$Suggerimento/InfoComandi.visible = true

func _on_Indietro_pressed():              #se clicca Indietro nella schermata dei suggerimenti questi ultimi spariscono
	$Suggerimento/InfoComandi.visible = false


#FINE

func _on_CambioScena_body_entered(body):   #se clicca Suggerimenti si apre la schermata dei suggerimenti
	if Punteggi.punteggio2 >= 80 and Punteggi.informazioni2 == 2:
		$CanvasLayer3/FineLivello2.visible = true
	elif Punteggi.punteggio2 < 80 and Punteggi.informazioni2 == 2:
		$CanvasLayer3/ObiettivoNonRaggiunto2.visible = true
	elif Punteggi.punteggio2 >= 80 and Punteggi.informazioni2 < 2:
		$CanvasLayer3/ObiettivoNonRaggiunto2.visible = true
	else:
		$CanvasLayer3/ObiettivoNonRaggiunto2.visible = true

func _on_BottonePausa_pressed():
	$CanvasLayer2/Pausa.visible = true
	get_tree().paused = true

func _on_Ok_pressed():
	$CanvasLayer3/Livello2Inf.visible = false


#OBIETTIVO NON RAGGIUNTO

func _on_Button_pressed():               #se l'obiettivo non è raggiunto visualizza l'avviso
	$CanvasLayer3/ObiettivoNonRaggiunto2.visible = false
	
func _on_Button2_pressed():
	get_tree().change_scene("res://Foresta/Livello2.tscn")
	PlayerStats.health = 4
	Punteggi.punteggio2 = 0
	Punteggi.informazioni2 = 0
	VitaminaB12Stats.barB12 = 0

#QUIZ

func _on_Ok2_pressed():
	$CanvasLayer3/FineLivello2.visible = false
	$CanvasLayer3/Quiz2.visible = true

func _on_Prosegui3_pressed():
	PlayerStats.health = 4
	Punteggi.punteggio3 = 0
	Punteggi.informazioni3 = 0
	get_tree().change_scene("res://Foresta/Livello3.tscn")


func _on_Prosegui5_pressed():
	PlayerStats.health = 4
	Punteggi.punteggio3 = 0
	Punteggi.informazioni3 = 0
	get_tree().change_scene("res://Foresta/Livello3.tscn")

func _on_Prosegui4_pressed():
	PlayerStats.health = 4
	Punteggi.punteggio3 = 0
	Punteggi.informazioni3 = 0
	get_tree().change_scene("res://Foresta/Livello3.tscn")
