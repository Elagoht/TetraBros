extends State

@onready var line_2d: Line2D = $"../../TurretHead/Line2D"
@onready var tilemap: TileMapLayer


func enter() -> void:
	line_2d.modulate.a = 0
	tilemap = owner.get_node("../Tetris/Tilemap")
	$IdleTimer.start(5)

func _on_idle_timer_timeout() -> void:
	var row = -1
	for y in range(12):
		for x in range(20):
			if tilemap.get_cell_source_id(Vector2i(x, y)) != -1:
				row = y
				break
		if row != -1: break
	if row != -1 and row < 11:
		owner.wanted_row = randi_range(row, 10)
		state_machine.transition_to("initialize")
