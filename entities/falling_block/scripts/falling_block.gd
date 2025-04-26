extends RigidBody2D

class_name FallingBlock

@export var speed: int = 50

@onready var tilemap: TileMapLayer

func _ready() -> void:
	tilemap = get_parent().get_node("Tilemap")

func _physics_process(delta: float) -> void:
	move_and_collide(Vector2.DOWN*speed*delta)

func make_solid():
	var x = int((position.x+16)/32)
	var y = int((position.y+16)/32)
	tilemap.set_cell(Vector2i(x, y), 0, Vector2i(0, 0))
	queue_free()
