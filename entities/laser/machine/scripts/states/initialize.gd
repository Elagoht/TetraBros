extends State

@onready var line_2d: Line2D = $"../../TurretHead/Line2D"

func enter() -> void:
	owner.global_position = Vector2(-16, 0)

	var tween = create_tween()
	tween.tween_property(owner, "global_position", Vector2(32, 0), 3.0)
	tween.connect("finished", Callable(self, "_on_tween_finished"))

	line_2d.modulate.a = 0

func _on_tween_finished() -> void:
	state_machine.transition_to("callibrate")
