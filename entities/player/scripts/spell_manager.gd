extends Node

@onready var dragonsbreath = preload("res://entities/spells/DragonsBreath.tscn")

@onready var spells := {
	"idle": {
		"A": dragonsbreath,
		"B": dragonsbreath
	},
	"move": {
		"A": dragonsbreath,
		"B": dragonsbreath
	},
	"jump": {
		"A": dragonsbreath,
		"B": dragonsbreath
	}
}

@onready var cooldown_timer: Timer = $CooldownTimer
var cooldown_duration := 0.5 # seconds, adjust as needed

var current_state: String = "idle"
var player_suffix: String

func _ready():
	player_suffix = "_" + str(owner.player_id)
	cooldown_timer.wait_time = cooldown_duration
	cooldown_timer.one_shot = true

func cast_spell(caster: Player):
	var state = caster.state_machine.current_state.name.to_lower()
	if not state in ["idle", "move", "jump"]:
		return
	if cooldown_timer.time_left > 0:
		return

	var spell_scn = get_spell_scn(caster)
	if not spell_scn:
		return

	cooldown_timer.start()
	var spell = spell_scn.instantiate()
	spell.position = caster.global_position + Vector2(10, -10)
	spell.scale.x = -1 if caster.sprites.flip_h else 1
	spell.fired_by = caster
	get_tree().current_scene.add_child(spell)

func get_spell_scn(caster: Player) -> PackedScene:
	var state = caster.state_machine.current_state.name.to_lower()
	var action = "A" if Input.get_action_strength("spell_A" + player_suffix) > 0 else "B"
	return spells[state][action]
