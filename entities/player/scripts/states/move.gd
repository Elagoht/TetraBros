extends State

var player_suffix: String

func enter() -> void:
	player_suffix = "_" + str(owner.player_id)

func physics_update(_delta: float) -> void:
	# Get horizontal input
	var input_direction_x: float = Input.get_axis("move_left" + player_suffix, "move_right" + player_suffix)

	owner.velocity.x = input_direction_x * owner.speed

	owner.move_and_slide()

	# If no input, return to idle
	if input_direction_x == 0:
		state_machine.transition_to("idle")

func handle_input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("jump" + player_suffix):
		state_machine.transition_to("Jump")
