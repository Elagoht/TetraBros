extends State

@onready var turret_head: Sprite2D = $"../../TurretHead"
@onready var audio: AudioStreamPlayer2D = $CalibrateAudio
@onready var line_2d: Line2D = $"../../TurretHead/Line2D"

var wanted_row: int
var target_y: float

func enter() -> void:
	audio.play()
	wanted_row = owner.wanted_row
	target_y = wanted_row * 32
	line_2d.modulate.a = 0.75

func _process(delta: float) -> void:
	var current_y = turret_head.position.y
	turret_head.position.y = move_toward(current_y, target_y + 16, 300.0 * delta)

	if abs(current_y - target_y) < 1.0:
		owner.state_machine.transition_to("Idle")
