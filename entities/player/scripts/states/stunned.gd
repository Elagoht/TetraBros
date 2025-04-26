extends State

func enter() -> void:
	owner.sprites.play("stunned")
	owner.velocity = Vector2.ZERO

func physics_update(_delta: float) -> void:
	# Still should be affected by gravity and knockback
	owner.move_and_slide()

func handle_input(_event: InputEvent) -> void:
	pass

func exit() -> void:
	pass
