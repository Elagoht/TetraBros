extends Node

class_name Tetris

@onready var falling_block_resource = preload("res://entities/falling_block/falling_block.tscn")

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

func _ready() -> void:
	spawn_tetramino(Vector2i(7, 0), "L", 3)

func create_falling_block(tile_position: Vector2i) -> void:
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
