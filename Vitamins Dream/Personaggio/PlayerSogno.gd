# Gestisce il giocatore durante il gioco principale (foresta) 

extends KinematicBody2D

onready var animationPlayer = $AnimationPlayer  #carica le animazioni del giocatore
onready var animationTree = $AnimationTree     
onready var animationState = animationTree.get("parameters/playback") 
onready var swordHitbox = $HitboxPivot/SwordHitbox

var stats = PlayerStats                 #caica le variabili globali
var vitaminAStats = VitaminaAStats
var vitaminB1Stats = VitaminaB1Stats
var vitaminB2Stats = VitaminaB2Stats
var vitaminB12Stats = VitaminaB12Stats
var hit = Hitbox

var max_speed = 230    #parametri del giocatore
var acceleration = 480 
var roll_speed = 230
var friction = 1120
var friction2 = 500
var state = MOVE 
var velocity = Vector2.ZERO 
var roll_vector = Vector2.ZERO
var knockback = Vector2.ZERO
var knockback_vector = Vector2.ZERO
var damage = 0.5

enum{  #definisce i vari stati in cui si può trovare il giocatore
	MOVE,
	ROLL,
	ATTACK,
	DEATH
}

func _ready():
	animationTree.active = true
	swordHitbox.knockback_vector = roll_vector

func _physics_process(delta):
	match state:
		MOVE:
			move_state(delta)
		ROLL:
			roll_state(delta)
		ATTACK:
			attack_state(delta)
		DEATH:
			death_state(delta)
			

func _process(delta):
	if Input.is_action_just_pressed("roll"):
		state = ROLL

func move_state(delta):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()
			
	if input_vector != Vector2.ZERO: #se l'input è diverso da 0 allora carica i movimenti
		roll_vector = input_vector
		swordHitbox.knockback_vector = input_vector
		animationTree.set("parameters/Idle/blend_position", input_vector)
		animationTree.set("parameters/Walk/blend_position", input_vector)
		animationTree.set("parameters/Attack/blend_position", input_vector)
		animationTree.set("parameters/Roll/blend_position", input_vector)
		animationTree.set("parameters/Death/blend_position", input_vector)
		animationState.travel("Walk")
		velocity = velocity.move_toward(input_vector * max_speed, acceleration * delta)
	else:          #altrimenti se l'input è uguale a 0 allora rimane fermo (idle)
		animationState.travel("Idle")
		velocity = velocity.move_toward(Vector2.ZERO, friction * delta)
	
	move()
	if Input.is_action_just_pressed("attack"):
		state = ATTACK

func attack_state(delta): #entra nello stato di attacco che riporta all'animationTreeanimationState.travel("Attack")
	velocity = velocity.move_toward(Vector2.ZERO, friction2 * delta)
	move()
	animationState.travel("Attack")
	
func roll_state(delta):
	velocity = roll_vector * roll_speed
	animationState.travel("Roll")
	move()
	
func death_state(delta):
	animationState.travel("Death")
	
func move():
	velocity = move_and_slide(velocity)

func attack_animation_finished():
	state = MOVE

func roll_animation_finished():
	state = MOVE
	velocity = velocity / 2

func _on_Hurtbox_body_entered(body):    #aggiorna i punteggi quando viene attaccato dai nemici
	if body.name == "Ciambella" or body.name == "Ciambella2" or body.name == "Ciambella3":
		Punteggi.punteggio -= 10
		Punteggi.punteggio2 -= 10
		Punteggi.punteggio3 -= 10
		stats.health -= damage
	elif body.name == "Cioccolata" or body.name == "Cioccolata2":
		stats.health -= damage
		Punteggi.punteggio -= 5
		Punteggi.punteggio2 -= 5
		Punteggi.punteggio3 -= 5
	elif body.name == "Patatine" or body.name == "Patatine2" or body.name == "Patatine3":
		stats.health -= damage
		Punteggi.punteggio -= 15
		Punteggi.punteggio2 -= 15
		Punteggi.punteggio3 -= 15
	elif body.name == "Hamburger" or body.name == "Hamburger2":
		stats.health -= damage
		Punteggi.punteggio -= 5
		Punteggi.punteggio2 -= 5
		Punteggi.punteggio3 -= 5
	elif body.name == "Torta" or body.name == "Torta2":
		stats.health -= damage
		Punteggi.punteggio -= 10
		Punteggi.punteggio2 -= 10
		Punteggi.punteggio3 -= 10

