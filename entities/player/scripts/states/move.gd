extends State

var player_suffix: String

func enter() -> void:
	owner.sprites.play("move")
	player_suffix = "_" + str(owner.player_id)

func physics_update(_delta: float) -> void:
	var direction_x: float = Input.get_axis("move_left" + player_suffix, "move_right" + player_suffix)

	owner.velocity.x = direction_x * owner.speed

	owner.move_and_slide()
	owner.sprites.handle_looking_direction(direction_x)

	# If no input, return to idle
	if direction_x == 0:
		state_machine.transition_to("idle")

func handle_input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("move_up" + player_suffix):
		state_machine.transition_to("jump")
		
	if Input.is_action_just_pressed("move_down" + player_suffix):
		state_machine.transition_to("idle")
