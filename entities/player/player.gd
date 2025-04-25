extends CharacterBody2D

@export var speed: int = 300
@export var gravity: float = 980.0
@export var player_id: int = 1 # will be 2 players

@onready var sprites: AnimatedSprite2D = $Sprites
@onready var state_machine: StateMachine = $StateMachine

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
