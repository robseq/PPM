# Gestisce la barra della vitamina B1

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
	self.max_pills = VitaminaB1Stats.max_barB1
	self.pills = VitaminaB1Stats.barB1
	VitaminaB1Stats.connect("barB1_changed", self, "set_pills")
	VitaminaB1Stats.connect("max_barB1_changed", self, "set_max_pills")
