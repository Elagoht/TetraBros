extends State

var player_suffix: String

func enter() -> void:
	owner.sprites.play("block")
	owner.velocity.x = 0
	player_suffix = "_" + str(owner.player_id)

func physics_update(_delta: float) -> void:
	owner.move_and_slide()

func handle_input(_event: InputEvent) -> void:
	if Input.is_action_just_released("move_down" + player_suffix):
		state_machine.transition_to("idle")
			
	if Input.is_action_just_pressed("spell_A" + player_suffix):
		state_machine.transition_to("breezesphere")

	if Input.is_action_just_pressed("spell_B" + player_suffix):
		state_machine.transition_to("breezesphere")
