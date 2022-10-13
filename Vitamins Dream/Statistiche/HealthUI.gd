# Gestisce la salute del giocatore

extends Control

var hearths = 4 setget set_hearths
var max_hearts = 4 setget set_max_hearts

onready var hUIe = $HearthUIEmpty
onready var hUIf = $HearthUIFull

func set_hearths(value): #settiamo i cuori
	hearths = clamp(value, 0, max_hearts)
	if hUIf != null:
		hUIf.rect_size.x = hearths * 50
	
func set_max_hearts(value): #settiamo il max della barra
	max_hearts = max(value, 1)
	self.hearths = min(hearths, max_hearts)
	if hUIe != null:
		hUIe.rect_size.x = hearths * 50
	
func _ready():
	self.max_hearts = PlayerStats.max_health
	self.hearths = PlayerStats.health
	PlayerStats.connect("health_changed", self, "set_hearths")
	PlayerStats.connect("max_health_changed", self, "set_max_hearths")
