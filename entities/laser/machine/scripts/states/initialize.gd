extends State

func enter() -> void:
	owner.global_position = Vector2(-16, 0)

	var tween = create_tween()
	tween.tween_property(owner, "global_position", Vector2(32, 0), 3.0)
	tween.connect("finished", Callable(self, "_on_tween_finished"))

func _on_tween_finished() -> void:
	state_machine.transition_to("callibrate")
