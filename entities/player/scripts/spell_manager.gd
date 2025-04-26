extends Node

@export var dragonsBreath = preload("res://entities/spells/DragonsBreath.tscn") 
@export var dragonsRaise = preload("res://entities/spells/DragonsBreath.tscn")
@export var breezeSphere = preload("res://entities/spells/BreezeSphere.tscn")

var current_state: String = "idle"

func cast_spell(spell_string: String, caster: Node):
	var spell_scn = _get_current_spell(spell_string)
	if not spell_scn: return
	var spell = spell_scn.instantiate()
	spell.position = caster.global_position
	spell.scale.x = -1 if caster.sprites.flip_h else 1
	spell.fired_by = caster
	get_tree().current_scene.add_child(spell)

func _get_current_spell(spell: String) -> PackedScene:
	match spell:
		"dragonsbreath":
			return dragonsBreath
		"dragonsraise":
			return dragonsRaise
		"breezesphere":
			return breezeSphere
		_:
			return
