extends State

@onready var line_2d: Line2D = $"../../TurretHead/Line2D"

func enter() -> void:
	var tween = create_tween()
	tween.tween_property(owner, "global_position", Vector2(-16, 0), 1.0)
	tween.connect("finished", Callable(self, "_on_tween_finished"))

	line_2d.modulate.a = 0

func _on_tween_finished() -> void:
	state_machine.transition_to("idle")
