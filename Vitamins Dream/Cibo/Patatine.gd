# Patatine (non salutari)

extends KinematicBody2D

onready var Anim = $AnimatedSprite 
onready var stats = $EnemiesStats
onready var playerDetectionZone = $PlayerDetectionZone
onready var hit = Hitbox
var vitaminStats = VitaminaAStats

export var ACCELERATION = 250
export var MAX_SPEED = 50
export var FRICTION = 250
var knockback = Vector2.ZERO
var knockback_vector = Vector2.ZERO
var velocity = Vector2.ZERO
var damage = 1
var state = IDLE

enum{     
	IDLE,
	WANDER,
	CHASE,
	DEATH
}

func _physics_process(delta):
	knockback = knockback.move_toward(Vector2.ZERO,FRICTION * delta)
	knockback = move_and_slide(knockback)
	
	match state:
		IDLE:
			Anim.play("Idle")
			velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
			seek_player()
		WANDER:
			pass
		CHASE: 
			Anim.play("Walk")
			var player = playerDetectionZone.player
			if player != null:
				var direction = (player.global_position - global_position).normalized()
				velocity = velocity.move_toward(direction * MAX_SPEED, ACCELERATION * delta)
			else:
				state = IDLE
			Anim.flip_h = velocity.x < 0
		DEATH:
			Anim.play("Death")
			state = IDLE
	velocity = move_and_slide(velocity)

func seek_player():  #se il nemico rileva il giocatore lo insegue
	if playerDetectionZone.can_see_player():
		state = CHASE

func _on_Hurtbox_area_entered(area):
	state = DEATH
	stats.health -= hit.damage
	if stats.health == 0:  
		queue_free()
