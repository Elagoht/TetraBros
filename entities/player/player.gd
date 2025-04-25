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

func _ready() -> void:
	await get_tree().process_frame
	if state_machine:
		state_machine.transition_to("idle")
	else:
		push_error("State machine not found!")

func _physics_process(delta: float) -> void:
	# Apply gravity - this affects all states
	if not is_on_floor():
		velocity.y += gravity * delta
	
func _handle_input():
	if Input.is_action_just_pressed("attack_a"):
		spell_manager.cast_spell("A", global_position, facing_direction(), self)
	elif Input.is_action_just_pressed("attack_b"):
		spell_manager.cast_spell("B", global_position, facing_direction(), self)
	
func facing_direction() -> Vector2:
	return Vector2.RIGHT if $Sprite.flip_h == false else Vector2.LEFT
