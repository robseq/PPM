# Gestisce la barra della vitmaina B12 (stats)

extends Node2D

export(int) var max_barB12 = 5 setget set_max_barB12
var barB12 = max_barB12 setget set_barB12

signal no_barB12
signal barB12_changed(value)
signal max_barB12_changed(value)

func set_max_barB12(value):
	max_barB12 = value
	self.barB12 = min(barB12, max_barB12)
	emit_signal("max_barB2_changed")

func set_barB12(value):
	barB12 = value
	emit_signal("barB12_changed", barB12)
	if barB12 <= 0:
		emit_signal("no_barB12")
		
func _ready():
	self.barB12 = 0
