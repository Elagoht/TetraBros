extends State

@export var sound_resource = preload("res://entities/player/sounds/dragonsbreath_casting.ogg")
@export var spell_name: String

var sound: AudioStream
var player_suffix: String

func enter() -> void:
	player_suffix = "_" + str(owner.player_id)
	owner.sprites.play("cast_spell")
	owner.spellTimer.start(0.5)
	owner.spellPrepareSound.stream = sound_resource
	owner.spellPrepareSound.play()
	owner.spellCaster.cast_spell

func physics_update(_delta: float) -> void:
	owner.move_and_slide()

func _on_spell_timer_timeout() -> void:
	if state_machine.current_state == self:
		owner.spellCaster.cast_spell(spell_name, owner)
		state_machine.transition_to("idle")
