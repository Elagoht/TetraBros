extends Node

class_name Tetris

@onready var falling_block_resource = preload("res://entities/falling_block/falling_block.tscn")
@onready var tilemap: TileMapLayer = $Tilemap

@onready var blocks = {
	"I": {
		0: [
			[0,0,0,0],
			[1,1,1,1],
			[0,0,0,0],
			[0,0,0,0]
		],
		1: [
			[0,0,1,0],
			[0,0,1,0],
			[0,0,1,0],
			[0,0,1,0]
		]
	},
	"T": {
		0: [
			[0,0,0],
			[1,1,1],
			[0,1,0]
		],
		1: [
			[0,1,0],
			[1,1,0],
			[0,1,0]
		],
		2: [
			[0,0,0],
			[0,1,0],
			[1,1,1]
		],
		3: [
			[0,1,0],
			[0,1,1],
			[0,1,0]
		]
	},
	"L": {
		0: [
			[0,0,0],
			[1,1,1],
			[1,0,0]
		],
		1: [
			[1,1,0],
			[0,1,0],
			[0,1,0]
		],
		2: [
			[0,0,0],
			[0,0,1],
			[1,1,1]
		],
		3: [
			[0,1,0],
			[0,1,0],
			[0,1,1]
		]
	},
	"J": {
		0: [
			[0,0,0],
			[1,1,1],
			[0,0,1]
		],
		1: [
			[0,1,0],
			[0,1,0],
			[1,1,0]
		],
		2: [
			[0,0,0],
			[1,0,0],
			[1,1,1]
		],
		3: [
			[0,1,1],
			[0,1,0],
			[0,1,0]
		]
	},
	"S": {
		0: [
			[0,0,0],
			[0,1,1],
			[1,1,0]
		],
		1: [
			[1,0,0],
			[1,1,0],
			[0,1,0]
		]
	},
	"Z": {
		0: [
			[0,0,0],
			[1,1,0],
			[0,1,1]
		],
		1: [
			[0,0,1],
			[0,1,1],
			[0,1,0]
		]
	},
	"O": {
		0: [
			[1,1],
			[1,1]
		]
	}
}

@onready var falling_block_count: int = 0

func _ready() -> void:
	spawn_tetramino(Vector2i(7, 0), "L", 3)

func increase_falling_block_count(x: int = 1):
	falling_block_count += x

func decrease_falling_block_count(x: int = 1):
	falling_block_count -= x
	if falling_block_count <= 0:
		var type = blocks.keys()[randi_range(0, 6)]
		var size = len(blocks[type])
		
		var origin_x = randi_range(0, 20-size-1)
		var origin_y = -size
		var origin = Vector2i(origin_x, origin_y)
		var direction = randi_range(0, 3)
		spawn_tetramino(origin, type, direction)

func create_falling_block(tile_position: Vector2i) -> void:
	increase_falling_block_count(1)
	var block: FallingBlock = falling_block_resource.instantiate()
	add_child(block)
	block.global_position = tile_position*32

func spawn_tetramino(origin: Vector2i, type: String, direction: int) -> void:
	direction %= len(blocks[type])
	var block = blocks[type][direction]
	for row in range(len(block)):
		for column in range(len(block[0])):
			if block[row][column] == 0: continue
			var x = origin.x + column
			var y = origin.y + row
			create_falling_block(Vector2i(x, y))
