# Gestisce il primo livello 

extends Node2D

var vitaminAstats = VitaminaAStats

func _ready():
	get_tree().paused = false
	BackMusic.play()
	MenuMusic.stop()
		
func _process(delta):
	if PlayerStats.health == 0:         #se il giocatore muore ricomincia il livello
		get_tree().change_scene("res://Foresta/Livello1.tscn")
		PlayerStats.health = 4
		Punteggi.punteggio = 0
		Punteggi.informazioni = 0
		VitaminaAStats.barA = 0
		
	if VitaminaAStats.barA == VitaminaAStats.max_barA:     #se la barra della vitamina 
		$Informazioni1.visible = true                      #è piena compaiono le informazioni
		$Informazioni2.visible = true
		
	if ControlliAudio.pressed == 1:             #controlla se l'audio è attivo
		BackMusic.stream_paused = true
		$CanvasLayer2/Pausa/CanvasLayer3/Options/CheckButton3.pressed = false
	

#PAUSA

func _on_BottonePausa_pressed(): #se clicca il bottone di pausa viene visualizzato in menu di pausa
	$CanvasLayer2/Pausa.visible = true
	get_tree().paused = true

func _on_Riprendi_pressed():   #se il giocatore clicca Riprendi nel menù, quest ultimo sparisce
	get_tree().paused = false    #e viene tolta la pausa
	if ControlliAudio.pressed == 1:
		BackMusic.stream_paused = true
	$CanvasLayer2/Pausa.visible = false
	$CanvasLayer/BottonePausa.visible = true

#INFO COMANDI

func _on_BottoneSuggerimenti_pressed():   #se clicca Suggerimenti si apre la schermata dei suggerimenti
	$Suggerimento/InfoComandi.visible = true

func _on_Indietro_pressed():        #se clicca Indietro nella schermata dei suggerimenti questi ultimi spariscono
	$Suggerimento/InfoComandi.visible = false

#FINE 

func _on_CambioScena_body_entered(body):      #se il giocatore entra nell'area del cambio scena si passa alla scena successiva
	if Punteggi.punteggio >= 70 and Punteggi.informazioni == 2:
		$CanvasLayer3/FineLivello1.visible = true
	elif Punteggi.punteggio < 70 and Punteggi.informazioni == 2:
		$CanvasLayer3/ObiettivoNonRaggiunto.visible = true
	elif Punteggi.punteggio >= 70 and Punteggi.informazioni < 2:
		$CanvasLayer3/ObiettivoNonRaggiunto.visible = true
	else:
		$CanvasLayer3/ObiettivoNonRaggiunto.visible = true

		
func _on_Ok_pressed():
	$CanvasLayer3/Livello1Inf.visible = false

func _on_Ok2_pressed():
	$CanvasLayer3/FineLivello1.visible = false
	$CanvasLayer3/Quiz1.visible = true

#OPZIONI FINE 

func _on_Button_pressed():     
	$CanvasLayer3/ObiettivoNonRaggiunto.visible = false

func _on_Button2_pressed():                  #se l'obiettivo non è reggiunto ricomincia
	get_tree().change_scene("res://Foresta/Livello1.tscn")
	PlayerStats.health = 4
	Punteggi.punteggio = 0
	Punteggi.informazioni = 0
	VitaminaAStats.barA = 0

#QUIZ 

func _on_Prosegui3_pressed():
	PlayerStats.health = 4
	Punteggi.punteggio2 = 0
	Punteggi.informazioni2 = 0
	get_tree().change_scene("res://Foresta/Livello2.tscn")

	
func _on_Prosegui5_pressed():
	PlayerStats.health = 4
	Punteggi.punteggio2 = 0
	Punteggi.informazioni2 = 0
	get_tree().change_scene("res://Foresta/Livello2.tscn")


func _on_Prosegui4_pressed():
	PlayerStats.health = 4
	Punteggi.punteggio2 = 0
	Punteggi.informazioni2 = 0
	get_tree().change_scene("res://Foresta/Livello2.tscn")


#INFORMAZIONI

func _on_Chiudi11_pressed():
	$Informazioni1/Inf1/Informazioni1/Inf2.visible = false
	$Informazioni1/Inf1/Informazioni1/Inf1.visible = true
	$Informazioni1/Inf1/Informazioni1.visible = false

func _on_Chiudi2_pressed():
	$Informazioni2/Inf2/Informazioni2/Immagine.visible = false
	$Informazioni2/Inf2/Informazioni2/Testo.visible = true
	$Informazioni2/Inf2/Informazioni2.visible = false
