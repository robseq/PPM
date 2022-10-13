# Gestisce la barra della vitamina A

extends Control

var pills = 5 setget set_pills
var max_pills = 5 setget set_max_pills

onready var pillEmpty = $pillEmpty
onready var pillFull = $pillFull

func set_pills(value):
	pills = clamp(value, 0, max_pills)
	if pillFull != null:
		pillFull.rect_size.x = pills * 63
	
func set_max_pills(value):
	max_pills = max(value, 1)
	self.pills = min(pills, max_pills)
	if pillEmpty != null:
		pillEmpty.rect_size.x = pills * 63
	
func _ready():
	self.max_pills = VitaminaAStats.max_barA
	self.pills = VitaminaAStats.barA
	VitaminaAStats.connect("barA_changed", self, "set_pills")
	VitaminaAStats.connect("max_barA_changed", self, "set_max_pills")
