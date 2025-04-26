extends CharacterBody2D

@export var speed: int = 200
@export var gravity: float = 980.0
@export var player_id: int = 1 # will be 2 players
@export var total_jump_count: int = 2

@onready var jump_count: int = 0

@onready var sprites: AnimatedSprite2D = $Sprites
@onready var state_machine: StateMachine = $StateMachine
@onready var spell_manager = $SpellManager

@onready var particlesJump = preload("res://entities/player/particles/particles_jump.tscn")

var player_suffix: String

func _ready() -> void:
	player_suffix = "_" + str(player_id)
	
	await get_tree().process_frame
	if state_machine:
		state_machine.transition_to("idle")
	else:
		push_error("State machine not found!")
		
func _physics_process(delta: float) -> void:
	# Apply gravity - this affects all states
	if not is_on_floor():
		velocity.y += gravity * delta
	
	handle_spells()
	
func handle_spells():
	if Input.is_action_just_pressed("spell_A" + player_suffix):
		spell_manager.cast_spell("A", global_position, facing_direction(), self)
	elif Input.is_action_just_pressed("spell_B" + player_suffix):
		spell_manager.cast_spell("B", global_position, facing_direction(), self)
	
func facing_direction() -> Vector2:
	return Vector2.RIGHT if sprites.flip_h == false else Vector2.LEFT
