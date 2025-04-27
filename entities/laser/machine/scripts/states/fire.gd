extends State

@onready var tilemap: TileMapLayer

func enter() -> void:
	$FireTimer.start(0.5)
	tilemap = owner.get_node("../Tetris/Tilemap")

func update(_delta: float) -> void:
	pass

func exit() -> void:
	pass

func _on_fire_timer_timeout() -> void:
	for cell_x in range(20):
		tilemap.set_cell(Vector2i(cell_x, owner.wanted_row), -1)
		for cell_y in range(0, owner.wanted_row):
			if tilemap.get_cell_source_id(Vector2i(cell_x, cell_y)) != -1:
				tilemap.set_cell(Vector2i(cell_x, cell_y), -1)
				tilemap.owner.create_falling_block(Vector2i(cell_x, cell_y))
	var player_areas = get_tree().get_nodes_in_group("player")
	for player_area in player_areas:
		var player = player_area.get_parent()
		if owner.wanted_row*32 < player.global_position.y and player.global_position.y < owner.wanted_row*32+32:
			player.die()
	state_machine.transition_to("finish")
