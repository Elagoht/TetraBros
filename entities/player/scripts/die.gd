extends Node

class_name State

var state_machine: StateMachine

@onready var collision: CollisionShape2D = $"../../Collision"
@onready var hitbox: Area2D = $"../../HitBox"

func enter() -> void:
	owner.sprites.play("die")
	collision.queue_free()
	hitbox.queue_free()

func exit() -> void:
	pass

func update(_delta: float) -> void:
	pass

func physics_update(_delta: float) -> void:
	pass

func handle_input(_event: InputEvent) -> void:
	pass
