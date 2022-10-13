# Gestisce la pausa

extends Control

func _on_Esci_pressed(): #resettiamo anche i punteggi prima di tornare al menù principale
	$CanvasLayer/Conferma.visible = true
	$Riprendi.visible = false
	$Opzioni.visible = false
	$Esci.visible = false

func _on_Indietro_pressed():
	$CanvasLayer/Comandi.visible = false
	
func _on_Button2_pressed():
	$CanvasLayer3/Options.visible = false

func _on_Opzioni_pressed():
	$CanvasLayer3/Options.visible = true

#CONFERMA

func _on_Si_pressed():
	get_tree().paused = false
	PlayerStats.health = 4
	VitaminaAStats.barA = 0
	VitaminaB12Stats.barB12 = 0
	VitaminaB2Stats.barB2 = 0
	VitaminaB1Stats.barB1 = 0
	get_tree().change_scene("res://UI/Menu.tscn")

func _on_No_pressed():
	$CanvasLayer/Conferma.visible = false
	$Riprendi.visible = true
	$Opzioni.visible = true
	$Esci.visible = true
