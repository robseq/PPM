# Carne ferma 2 (salutare)

extends KinematicBody2D

onready var Anim = $AnimatedSprite 
onready var stats = $EnemiesStats
onready var hit = Hitbox
var vitaminStats = VitaminaB1Stats

export var ACCELERATION = 300
export var MAX_SPEED = 30
export var FRICTION = 250
var damage = 1
var knockback = Vector2.ZERO
var knockback_vector = Vector2.ZERO
var velocity = Vector2.ZERO
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
	Punteggi.punteggio += 20
	Punteggi.punteggio2 += 20
	Punteggi.punteggio3 += 20
	VitaminaB1Stats.barB1 += 1

