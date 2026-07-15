class_name CardData
extends Resource

signal level_changed(new_level: int)

var card_name: String

# Identifies a specific physical card so its permanent-deck and current-deck
# entries (see CardEntry) can be found and kept in sync, e.g. when an effect
# upgrades a card in hand and the permanent deck both.
var instance_id: int = 0

@export var level: int = 1:
	set(value):
		level = value
		level_changed.emit(level)

var damage: int = 0
var heal: int = 0
var shield: int = 0

var arms_needed: int = 2

func _init() -> void:
	instance_id = CardId.generate()

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
