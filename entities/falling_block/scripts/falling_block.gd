extends RigidBody2D

class_name FallingBlock

@export var speed: int = 50

@onready var tilemap: TileMapLayer
@onready var bottom_collider: CollisionShape2D = $Area2D/BottomCollider

func _ready() -> void:
	tilemap = get_parent().get_node("Tilemap")

func _physics_process(delta: float) -> void:
	move_and_collide(Vector2.DOWN*speed*delta)

func make_solid():
	var x = int((position.x+16)/32)
	var y = int((position.y+16)/32)
	tilemap.set_cell(Vector2i(x, y), 0, Vector2i(0, 0))
	queue_free()

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("player"):
		var player: Player = area.get_parent()
		if player.is_on_floor():
			print("player died")
