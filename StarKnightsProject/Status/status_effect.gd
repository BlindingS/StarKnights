class_name StatusEffect
extends Resource

@export var id: String
@export var stacks: int = 1

func on_apply(target: Combatent) -> void:
	pass

func on_remove(target: Combatent) -> void:
	pass

func on_turn_start(target: Combatent) -> void:
	pass

func on_turn_end(target: Combatent) -> void:
	pass

func modify_damage(amount: int, card: CardData) -> int:
	return amount

func modify_healing(amount: int, card: CardData) -> int:
	return amount
