class_name CharacterUI
extends Control

@export var character: Character
@onready var sprite: Sprite2D = $Sprite2D

func _ready() -> void:
	sprite.texture = character.portrait

func _on_area_2d_mouse_entered() -> void:
	tooltip.show_tooltip(character)

func _on_area_2d_mouse_exited() -> void:
	tooltip.hide_tooltip()

func set_targeted(highlighted: bool) -> void:
	sprite.modulate = Color.YELLOW if highlighted else Color.WHITE
