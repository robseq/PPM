# Gestisce la barra della vitamina B1 (stats)

extends Node2D

export(int) var max_barB1 = 5 setget set_max_barB1
var barB1 = max_barB1 setget set_barB1

signal no_barB1
signal barB1_changed(value)
signal max_barB1_changed(value)

func set_max_barB1(value):
	max_barB1 = value
	self.barB1 = min(barB1, max_barB1)
	emit_signal("max_barB1_changed")

func set_barB1(value):
	barB1 = value
	emit_signal("barB1_changed", barB1)
	if barB1 <= 0:
		emit_signal("no_barB1")
		
func _ready():
	self.barB1 = 0
