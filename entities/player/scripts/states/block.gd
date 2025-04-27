extends State

var player_suffix: String
@onready var sphere_area: Area2D = $"../../Sphere/SphereArea"

func enter() -> void:
	owner.sprites.play("block")
	owner.velocity.x = 0
	player_suffix = "_" + str(owner.player_id)
	owner.sphere_opacity_target = 1
	sphere_area.add_to_group("block")

func physics_update(_delta: float) -> void:
	owner.move_and_slide()

func handle_input(_event: InputEvent) -> void:
	if not Input.is_action_pressed("move_down" + player_suffix):
		state_machine.transition_to("idle")
	if owner.is_on_floor():
		if Input.is_action_just_pressed("spell_A" + player_suffix):
			state_machine.transition_to("spell1")

		if Input.is_action_just_pressed("spell_B" + player_suffix):
			state_machine.transition_to("spell2")

func exit() -> void:
	owner.sphere_opacity_target = 0
	sphere_area.remove_from_group("block")
