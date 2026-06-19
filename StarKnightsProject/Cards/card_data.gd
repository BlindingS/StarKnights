class_name CardData
extends Resource

@export var level: int = 1

var damage: int = 0
var heal: int = 0
var shield: int = 0

var arms_needed: int = 2

func play_card(owner: Character) -> void:
	pass

func modify_damage(owner: Character) -> void:
	for modifier in battle_manager.get_alive_combatents():
		damage = modifier.modify_damage(damage, self, owner)

func modify_heal(owner: Character) -> void:
	for modifier in battle_manager.get_alive_combatents():
		heal = modifier.modify_heal(heal, self, owner)

func modify_shield(owner: Character) -> void:
	for modifier in battle_manager.get_alive_combatents():
		shield = modifier.modify_shield(shield, self, owner)
