#gestisce la barra della vitamina A (stats)

extends Node2D

export(int) var max_barA = 5 setget set_max_barA
var barA = max_barA setget set_barA

signal no_barA
signal barA_changed(value)
signal max_barA_changed(value)

func set_max_barA(value):
	max_barA = value
	self.barA = min(barA, max_barA)
	emit_signal("max_barA_changed")

func set_barA(value):
	barA = value
	emit_signal("barA_changed", barA)
	if barA <= 0:
		emit_signal("no_barA")
		
func _ready():
	self.barA = 0
