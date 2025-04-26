extends AnimatableBody2D

class_name FallingBlock

@export var speed: int = 50

@onready var tetris: Tetris
@onready var tilemap: TileMapLayer
@onready var bottom_collider: CollisionShape2D = $Area2D/BottomCollider

func world_to_tile(world_position: Vector2) -> Vector2i:
	var x = int(world_position.x/32)
	var y = int(world_position.y/32)
	return Vector2i(x, y)

func _ready() -> void:
	tetris = get_parent()
	tilemap = tetris.get_node("Tilemap")

func _process(delta: float) -> void:
	if position.y > 392:
		tetris.decrease_falling_block_count(1)
		queue_free()

func _physics_process(delta: float) -> void:
	if move_and_collide(Vector2.DOWN*speed*delta):
		make_solid()

func make_solid():
	tetris.decrease_falling_block_count(1)
	var tile_position = world_to_tile(position+Vector2(16, 16))
	tilemap.set_cell(tile_position, 0, Vector2i(0, 0))
	queue_free()

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("player"):
		var player: Player = area.get_parent()
		if player.is_on_floor():
			player.die()
