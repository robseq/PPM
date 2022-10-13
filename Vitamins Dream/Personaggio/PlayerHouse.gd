# Gestisce le animazioni del giocatore nella scena iniziale (idle)

extends KinematicBody2D

onready var animationPlayer = $AnimationPlayer  #animazioni del giocatore
onready var animationTree = $AnimationTree #albero delle animazioni
onready var animationState = animationTree.get("parameters/playback")

func _physics_process(delta):
	animationState.travel("Idle")

