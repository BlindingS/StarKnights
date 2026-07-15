class_name CharacterUI
extends Control

var character: Character
@onready var sprite: Sprite2D = $Sprite2D
@onready var hp_label: Label = $HPLabel

func setup(new_character: Character) -> void:
	character = new_character
	sprite.texture = character.portrait
	character.hp_changed.connect(_on_hp_changed)
	_on_hp_changed(character.current_hp, character.max_hp)

func _on_hp_changed(current_hp: int, max_hp: int) -> void:
	hp_label.text = "%d/%d" % [current_hp, max_hp]

func _on_area_2d_mouse_entered() -> void:
	tooltip.show_tooltip(character)

func _on_area_2d_mouse_exited() -> void:
	tooltip.hide_tooltip()

func set_targeted(highlighted: bool) -> void:
	sprite.modulate = Color.YELLOW if highlighted else Color.WHITE

func _exit_tree() -> void:
	if character and character.hp_changed.is_connected(_on_hp_changed):
		character.hp_changed.disconnect(_on_hp_changed)
	character = null
