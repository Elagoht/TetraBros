extends State

var player_suffix: String

@export var acceleration: float = 2000.0
@export var friction: float = 1500.0

func enter() -> void:
	owner.sprites.play("move")
	player_suffix = "_" + str(owner.player_id)

func physics_update(_delta: float) -> void:
	var direction_x: float = Input.get_axis("move_left" + player_suffix, "move_right" + player_suffix)
	var target_speed = direction_x * owner.speed
	if direction_x != 0:
		owner.velocity.x = move_toward(owner.velocity.x, target_speed, acceleration * _delta)
	else:
		owner.velocity.x = move_toward(owner.velocity.x, 0, friction * _delta)

	owner.move_and_slide()
	owner.sprites.handle_looking_direction(direction_x)

	# If no input and velocity is near zero, return to idle
	if direction_x == 0 and abs(owner.velocity.x) < 1:
		state_machine.transition_to("idle")

func handle_input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("move_up" + player_suffix):
		state_machine.transition_to("jump")

	if Input.is_action_just_pressed("move_down" + player_suffix):
		state_machine.transition_to("block")
	
	if Input.is_action_just_pressed("spell_A" + player_suffix):
		state_machine.transition_to("spell_fireball")
