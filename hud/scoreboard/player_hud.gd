extends VBoxContainer

@export var player_name: String = ""
@export var id: int = 0
@export var revert: bool = false

const star_resource = preload("res://hud/scoreboard/star.png")

func _ready() -> void:
	$PlayerName.text = player_name
	if revert:
		$PlayerName.horizontal_alignment = 2

func update_score(new_score: int) -> void:
	var stars = []
	for i in range(3):
		var star = TextureRect.new()
		star.texture = star_resource
		star.modulate = Color(1, 1, 1) if i < new_score else Color(0, 0, 0)
		stars.append(star)

	if revert:
		stars.reverse()

	clear_container($Stars)
	for star in stars:
		$Stars.add_child(star)

func clear_container(container: Control) -> void:
	for child in container.get_children():
		child.queue_free()
