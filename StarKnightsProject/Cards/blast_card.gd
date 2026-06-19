class_name BlastCard
extends CardData

func play_card(owner: Character) -> void:
	damage = 4 + (level * 2)
	modify_damage(owner)
	card_effects.damage(battle_manager.get_front_enemies(1),damage)
