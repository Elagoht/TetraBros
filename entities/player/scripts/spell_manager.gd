extends Node

@export var idle_spells := {
	"A": preload("res://entities/spells/FireBeam.tscn"), 
	"B": preload("res://entities/spells/FireBeam.tscn")
}
@export var block_spells := {
	"A": preload("res://entities/spells/BreezeSphere.tscn"), 
	"B": preload("res://entities/spells/BreezeSphere.tscn")
}
@export var move_spells := {
	"A": preload("res://entities/spells/FireBeam.tscn"),
	"B": preload("res://entities/spells/FireBeam.tscn")
}
@export var jump_spells := {
	"A": preload("res://entities/spells/FireBeam.tscn"),
	"B": preload("res://entities/spells/FireBeam.tscn")
}

var current_state: String = "idle"

func cast_spell(button: String, caster: Node):
	var spell_scn = _get_current_spell(button)
	if not spell_scn: return
	var spell = spell_scn.instantiate()
	spell.position = caster.global_position
	spell.scale.x = -1 if caster.sprites.flip_h else 1
	spell.fired_by = caster
	get_tree().current_scene.add_child(spell)

func _get_current_spell(button: String) -> PackedScene:
	match current_state:
		"idle":
			return idle_spells.get(button, null)
		"block":
			return idle_spells.get(button, null)
		"move":
			return move_spells.get(button, null)
		"jump":
			return jump_spells.get(button, null)
		_:
			return null
