extends Node

@onready var dragonsbreath = preload("res://entities/spells/DragonsBreath.tscn")

var current_state: String = "idle"

func cast_spell(spell_string: String, caster: Node):
	var spell_scn = _get_current_spell(spell_string)
	if not spell_scn: return
	var spell = spell_scn.instantiate()
	spell.position = caster.global_position + Vector2(10, -10)
	spell.scale.x = -1 if caster.sprites.flip_h else 1
	spell.fired_by = caster
	get_tree().current_scene.add_child(spell)

func _get_current_spell(spell: String) -> PackedScene:
	match spell:
		"dragonsbreath":
			return dragonsbreath
		_:
			return
