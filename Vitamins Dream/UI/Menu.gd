# Gestisce il menu del gioco

extends Control
	
func _ready():
	get_tree().paused = false
	MenuMusic.play()
	BackMusic.stop()
	
func _on_Gioca_pressed():                               #entra nel gioco
	get_tree().change_scene("res://Casa/Casa.tscn")
	
func _on_Credits_pressed():                             #crediti di gioco
	$CanvasLayer4/Credits.visible = true
	
func _on_Opzioni_pressed():                             #Opzioni del gioco
	$CanvasLayer3/Options.visible = true
	
func _on_Esci_pressed():                                #Esci dal gioco
	$CanvasLayer/Conferma.visible = true
	$RichTextLabel.visible = false
	$RichTextLabel3.visible = false
	$Gioca.visible = false
	$Credits.visible = false
	$Opzioni.visible = false
	$Esci.visible = false

func _on_Button_pressed():
	$CanvasLayer4/Credits.visible = false

func _on_Button2_pressed():
	$CanvasLayer3/Options.visible = false

#CONFERMA 

func _on_Si_pressed():
	get_tree().quit()

func _on_No_pressed():
	$CanvasLayer/Conferma.visible = false
	$Gioca.visible = true
	$Credits.visible = true
	$Opzioni.visible = true
	$Esci.visible = true
	$RichTextLabel.visible = true
	$RichTextLabel3.visible = true

