extends State

var player_suffix: String

func enter() -> void:
	owner.sprites.play("idle")
	player_suffix = "_" + str(owner.player_id)

func physics_update(_delta: float) -> void:
	owner.move_and_slide()

func handle_input(_event: InputEvent) -> void:
	for key in ["move_left", "move_right"]:
		if Input.is_action_pressed(key + player_suffix):
			state_machine.transition_to("move")
			return

	if Input.is_action_just_pressed("move_down" + player_suffix):
		state_machine.transition_to("block")

	if Input.is_action_just_pressed("move_up" + player_suffix):
		state_machine.transition_to("jump")

	if Input.is_action_just_pressed("spell_A" + player_suffix):
		state_machine.transition_to("dragonsbreath")

	if Input.is_action_just_pressed("spell_B" + player_suffix):
		state_machine.transition_to("dragonsraise")
