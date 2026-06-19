class_name CardEffects
extends Node


func damage(targets: Array[Combatent], amount: int) -> void:
	for t in targets:
		if t != null:
			t.take_damage(amount)

func heal(targets: Array, amount: int) -> void:
	for t in targets:
		if t != null:
			t.heal(amount)
			
			
