extends State

func enter() -> void:
	owner.sprites.play("stunned")
	$StunnedTimer.start()

func physics_update(_delta: float) -> void:
	owner.move_and_slide()

func _on_timer_timeout() -> void:
	state_machine.transition_to("idle")
