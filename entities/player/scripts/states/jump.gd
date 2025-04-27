extends State

@export var jump_strength: float = 300.0

var player_suffix: String

func enter() -> void:
	player_suffix = "_" + str(owner.player_id)

func physics_update(_delta: float) -> void:
	var direction_x: float = Input.get_axis("move_left" + player_suffix, "move_right" + player_suffix)
	
	owner.velocity.x = direction_x * owner.speed
	
	if Input.is_action_just_pressed("move_up" + player_suffix):
		if owner.jump_count < owner.total_jump_count:
			jump_with_effects()
	
	owner.move_and_slide()
	owner.sprites.handle_looking_direction(direction_x)
	
	if owner.is_on_floor():
		if direction_x == 0:
			state_machine.transition_to("idle")
		else:
			state_machine.transition_to("move")

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("move_up" + player_suffix):
		owner.jump_count += 1

func handle_input(event: InputEvent) -> void:
	if event.is_action_pressed("move_down" + player_suffix):
		state_machine.transition_to("block")
	if Input.is_action_just_pressed("spell_A" + player_suffix):
		state_machine.transition_to("spell_fireball")


func jump_with_effects():
	owner.velocity.y = - jump_strength
	var particles = owner.particlesJump.instantiate()
	particles.global_position = owner.global_position
	owner.get_tree().current_scene.add_child(particles)
	particles.emitting = true

func exit() -> void:
	pass
