class_name BlastCard
extends CardData

var base_damage: int
var damage_scaling: int
var shots: int

func play_card(owner: Character) -> void:
	damage = base_damage + ((level - 1) * damage_scaling)

	modify_damage(owner)

	for i in range(shots):
		card_effects.damage(
			battle_manager.get_front_enemies(1),
			damage
		)
