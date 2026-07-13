class_name BlastCard
extends CardData


var base_damage: int
var damage_scaling: int
var shots: int

func _init(definition: Dictionary) -> void:
	setup(definition)


func setup(definition: Dictionary) -> void:
	card_name = definition.name
	base_damage = definition.damage
	damage_scaling = definition.damage_scaling
	shots = definition.shots
	arms_needed = definition.arms

func play_card(owner: Character) -> void:
	damage = base_damage + ((level - 1) * damage_scaling)
	modify_damage(owner)

	for i in range(shots):
		card_effects.damage(battle_manager.get_front_enemies(1),damage) #May change from front enemy to target enemy
