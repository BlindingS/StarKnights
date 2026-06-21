class_name CardDatabase
extends Resource

const BLAST_CARDS := { # Must add portraits (textures) to the database
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
		"shots": 2,
		"arms": 2
	},
}


func create_card(card_name: String) -> CardData:

	if BLAST_CARDS.has(card_name):
		return BlastCard.new(BLAST_CARDS[card_name])
	
	# Add if statements for other card families

	push_error("Card not found: " + card_name)
	return null
