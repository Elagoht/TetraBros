extends Node

@export var idle_spells := {
	"A": preload("res://spells/Fireball.tscn"), 
	"B": preload("res://spells/IceBlast.tscn")
}
@export var move_spells := {
	"A": preload("res://spells/LightningBolt.tscn"),
	"B": preload("res://spells/FlameWave.tscn")
}
@export var jump_spells := {
	"A": preload("res://spells/Meteor.tscn"),
	"B": preload("res://spells/WindSlice.tscn")
}

var current_state := "idle" # "move", "jump" vb.

func cast_spell(button: String, position: Vector2, direction: Vector2, caster: Node):
	var spell_scn = _get_current_spell(button)
	if not spell_scn: return
	var spell = spell_scn.instantiate()
	spell.position = position
	spell.rotation = direction.angle()
	spell.fired_by = caster
	get_tree().current_scene.add_child(spell)

func _get_current_spell(button: String) -> PackedScene:
	match current_state:
		"idle":
			return idle_spells.get(button, null)
		"move":
			return move_spells.get(button, null)
		"jump":
			return jump_spells.get(button, null)
		_:
			return null
