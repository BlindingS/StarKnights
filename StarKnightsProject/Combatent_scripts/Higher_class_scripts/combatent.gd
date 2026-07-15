class_name Combatent
extends Resource

signal hp_changed(current_hp: int, max_hp: int)

var current_hp: int = 0:
	set(value):
		current_hp = value
		hp_changed.emit(current_hp, max_hp)

var max_hp: int = 0
var combatent_name: String
var portrait : Texture2D

var arm_number: int = 2
var arms_used: int = 0

var statuses: Array[StatusEffect] = []

func take_damage(amount: int) -> void:
	current_hp = max(current_hp - amount, 0)

func heal(amount: int) -> void:
	current_hp = min(current_hp + amount, max_hp)

func add_status(status: StatusEffect) -> void:
	statuses.append(status)

func has_status(status_name: String) -> bool:
	for status in statuses:
		if status.id == status_name:
			return true
	return false

func modify_damage(amount: int, card: CardData, owner: Combatent) -> int:
	return amount

func modify_shield(amount: int, card: CardData, owner: Combatent) -> int:
	return amount

func modify_heal(amount: int, card: CardData, owner: Combatent) -> int:
	return amount
