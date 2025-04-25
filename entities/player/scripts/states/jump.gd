extends State

@export var jump_strength: float = 500.0

var player_suffix: String

func enter() -> void:
	player_suffix = "_" + str(owner.player_id)
	# Apply initial upward velocity for the jump
	owner.velocity.y = - jump_strength
	owner.particlesJump.global_position = owner.global_position
	owner.get_tree().current_scene.add_child(owner.particlesJump)
	owner.particlesJump.emitting = true

	
func physics_update(_delta: float) -> void:
	
	var direction_x: float = Input.get_axis("move_left" + player_suffix, "move_right" + player_suffix)

	owner.velocity.x = direction_x * owner.speed

	owner.move_and_slide()
	owner.sprites.handle_looking_direction(direction_x)
	
	if owner.is_on_floor():
		if direction_x == 0:
			state_machine.transition_to("idle")
		else:
			state_machine.transition_to("move")

func exit() -> void:
	owner.particlesJump.emitting = false
