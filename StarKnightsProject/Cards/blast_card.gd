class_name BlastCard
extends CardData

const CARDS := {
	"Blast Rifle": {
		"damage": 8,
		"damage_scaling": 4,
		"shots": 1,
		"arms": 2
	},
	"Blast Pistol": {
		"damage": 5,
		"damage_scaling": 3,
		"shots": 1,
		"arms": 1
	},
	"Blast Cannon": {
		"damage": 10,
		"damage_scaling": 5,
		"shots": 1,
		"arms": 2
	},
	"Double-Blaster": {
		"damage": 4,
		"damage_scaling": 3,
		"shots": 2,
		"arms": 2
	}
}

var base_damage: int
var damage_scaling: int
var shots: int

func _init(card_name: String = "") -> void:
	setup(card_name)
	

func setup(card_name: String = "") -> void:
	if card_name.is_empty():
		return

	if not CARDS.has(card_name):
		push_error("Unknown Blast card: " + card_name)
		return

	var data = CARDS[card_name]

	base_damage = data.damage
	damage_scaling = data.damage_scaling
	shots = data.shots
	arms_needed = data.arms

func play_card(owner: Character) -> void:
	damage = base_damage + ((level - 1) * damage_scaling)
	modify_damage(owner)

	for i in range(shots):
		card_effects.damage(battle_manager.get_front_enemies(1),damage) #May change from front enemy to target enemy
