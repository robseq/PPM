# Gestisce la barra della vitamina B2 (stats)

extends Node2D

export(int) var max_barB2 = 5 setget set_max_barB2
var barB2 = max_barB2 setget set_barB2

signal no_barB2
signal barB2_changed(value)
signal max_barB2_changed(value)

func set_max_barB2(value):
	max_barB2 = value
	self.barB2 = min(barB2, max_barB2)
	emit_signal("max_barB2_changed")

func set_barB2(value):
	barB2 = value
	emit_signal("barB2_changed", barB2)
	if barB2 <= 0:
		emit_signal("no_barB2")
		
func _ready():
	self.barB2 = 0
