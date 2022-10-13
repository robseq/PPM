# Uova ferma (salutare)

extends KinematicBody2D

onready var Anim = $AnimatedSprite 
onready var stats = $EnemiesStats
onready var hit = Hitbox
var vitaminStats = VitaminaB12Stats

export var ACCELERATION = 300
export var MAX_SPEED = 30
export var FRICTION = 250
var knockback = Vector2.ZERO
var knockback_vector = Vector2.ZERO
var velocity = Vector2.ZERO
var damage = 1
var state = IDLE

enum{            
	IDLE,
	WANDER,
	DEATH
}

func _physics_process(delta):
	knockback = knockback.move_toward(Vector2.ZERO,FRICTION * delta)
	knockback = move_and_slide(knockback)
	
	match state:
		IDLE:
			Anim.play("Idle")
		WANDER:
			pass
		DEATH:
			Anim.play("Death")
			state = IDLE


func _on_Hurtbox_body_entered(body):
	queue_free()
	Punteggi.punteggio += 15
	Punteggi.punteggio2 += 15
	Punteggi.punteggio3 += 15
	VitaminaB12Stats.barB12 += 1
