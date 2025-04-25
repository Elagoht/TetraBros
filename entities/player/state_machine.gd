extends Node

class_name StateMachine

var current_state: State
var states: Dictionary = { }

func _ready() -> void:
	# Initialize all child states
	for child in get_children():
		if child is State:
			states[child.name.to_lower()] = child
			child.state_machine = self

func _physics_process(delta: float) -> void:
	if current_state:
		current_state.physics_update(delta)

func _process(delta: float) -> void:
	if current_state:
		current_state.update(delta)

func _unhandled_input(event: InputEvent) -> void:
	if current_state:
		current_state.handle_input(event)

func transition_to(target_state_name: String) -> void:
	if not states.has(target_state_name.to_lower()):
		push_error("State %s not found!" % target_state_name)
		return

	if current_state:
		current_state.exit()

	current_state = states[target_state_name.to_lower()]
	current_state.enter()
