extends State

func enter() -> void:
	owner.velocity = Vector2.ZERO

func handle_input(_event: InputEvent) -> void:
	for key in ["move_left", "move_up", "move_right", "move_down"]:
		if Input.is_action_just_pressed(key):
			state_machine.transition_to("Move")
			return
	if Input.is_action_just_pressed("jump"):
		state_machine.transition_to("Jump")
