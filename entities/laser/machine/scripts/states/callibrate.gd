extends State

@onready var turret_head: Sprite2D = $"../../TurretHead"

var wanted_row: int
var target_y: float

func enter() -> void:
	wanted_row = owner.wanted_row
	target_y = wanted_row * 32

func _process(delta: float) -> void:
	var current_y = turret_head.position.y
	turret_head.position.y = move_toward(current_y, target_y, 300.0 * delta)

	if abs(current_y - target_y) < 1.0:
		owner.state_machine.transition_to("Idle")
