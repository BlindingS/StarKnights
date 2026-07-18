class_name BatrocityEnemy
extends EnemyCombatent

func _init() -> void:
	setup({
		"name": "Batrocity",
		"max_hp": 20,
		"attack_damage": 6,
		"art": preload("res://Sprite_art/Enemy_art/Batrocity.png"),
	})
