extends State

@onready var line_2d: Line2D = $"../../TurretHead/Line2D"

func enter() -> void:
	line_2d.modulate.a = 0.5
