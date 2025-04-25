extends CharacterBody2D

@export var speed: int = 750

@onready var state_machine: StateMachine = $StateMachine

func _ready() -> void:
	# Wait one frame to ensure all nodes are properly initialized
	await get_tree().process_frame
	if state_machine:
		state_machine.transition_to("idle")
	else:
		push_error("State machine not found!")

func _physics_process(_delta: float) -> void:
	pass
