class_name CardEntry
extends Resource

# Lightweight deck representation: just enough to rebuild a real CardData
# on demand via CardDatabase. Keeps the permanent/current decks cheap to
# copy and shuffle, since damage/shots/arms etc. are fully determined by
# card_name + level anyway.
var card_name: String
var level: int

var instance_id: int = 0

func _init(name: String = "", starting_level: int = 1, id: int = 0) -> void:
	card_name = name
	level = starting_level
	instance_id = id if id != 0 else CardId.generate()
