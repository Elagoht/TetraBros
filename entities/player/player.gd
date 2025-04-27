extends CharacterBody2D

class_name Player

@export var speed: int = 200
@export var gravity: float = 980.0
@export var player_id: int = 1 # will be 2 players
@export var total_jump_count: int = 2
@export var health: int = 10

@onready var jump_count: int = 0
@onready var sprites: AnimatedSprite2D = $Sprites
@onready var state_machine: StateMachine = $StateMachine
@onready var spellTimer: Timer = $SpellCaster/SpellTimer
@onready var spellPrepareSound: AudioStreamPlayer2D = $SpellCaster/SpellPrepareSound

@onready var particlesJump = preload("res://entities/player/particles/particles_jump.tscn")

var player_suffix: String
var is_stunned: bool = false
var sphere_opacity_target: float = 0

func get_direciton() -> Vector2i:
	if $"Sprites".flip_h:
		return Vector2i.LEFT
	else:
		return Vector2i.RIGHT

func _ready() -> void:
	player_suffix = "_" + str(player_id)

	await get_tree().process_frame
	if state_machine:
		state_machine.transition_to("idle")
	else:
		push_error("State machine not found!")

func _physics_process(delta: float) -> void:
	void_death()
	
	if is_on_floor():
		jump_count = 0

	# Apply gravity - this affects all states
	if not is_on_floor():
		velocity.y += gravity * delta

func stun_player() -> void:
	is_stunned = true
	if state_machine:
		state_machine.transition_to("stunned")

func renew_health() -> void:
	health = 10
	is_stunned = false
	if state_machine:
		state_machine.transition_to("idle")

func apply_knockback(knockback: Vector2) -> void:
	velocity = knockback

func die() -> void:
	state_machine.transition_to("die")

func void_death() -> void:
	if  state_machine.current_state:
		if state_machine.current_state.name != "die":
			if global_position.y > 600:
				die()
