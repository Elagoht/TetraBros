extends Node2D

@export var wanted_row: int = 2
@onready var state_machine: StateMachine = $StateMachine

func _ready() -> void:
	await get_tree().process_frame
	if state_machine:
		state_machine.transition_to("initialize")
	else:
		push_error("State machine not found!")
