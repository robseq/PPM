# Gestisce il quiz 3

extends Control

var corretto1 = 0

func _on_Prosegui_pressed():
	$Intro.visible = false
	$Domanda1.visible = true

#DOMANDA 1

func _on_CheckBox_pressed():
	$Domanda1.visible = false
	$PassaAllaDomanda2.visible = true
	corretto1 = 1
	
func _on_CheckBox2_pressed():
	$Domanda1.visible = false
	$Errato.visible = true

func _on_CheckBox3_pressed():
	$Domanda1.visible = false
	$Errato.visible = true

func _on_VaiDomanda2_pressed():
	$Errato.visible = false
	$Domanda2.visible = true

func _on_Prosegui2_pressed():
	$PassaAllaDomanda2.visible = false
	$Domanda2.visible = true

#DOMANDA 2

func _on_CheckBoxA_pressed():
	if corretto1 == 1:
		$Domanda2.visible = false
		$UnaSuDue.visible = true
	else:
		$Domanda2.visible = false
		$Errato2.visible = true

func _on_CheckBoxB_pressed():
	if corretto1 == 1:
		$Domanda2.visible = false
		$UnaSuDue.visible = true
	else:
		$Domanda2.visible = false
		$Errato2.visible = true

func _on_CheckBoxC_pressed():
	if corretto1 == 1:
		$Domanda2.visible = false
		$QuizCorretto.visible = true
	else:
		$Domanda2.visible = false
		$UnaSuDue.visible = true

func _on_Prosegui3_pressed():
	pass # Replace with function body.
