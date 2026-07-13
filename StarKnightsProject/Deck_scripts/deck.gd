class_name Deck
extends Resource

# Base bookkeeping shared by PermanentDeck and CurrentDeck: both are just a
# bag of CardEntry with add/remove/upgrade/find. Round/turn-specific
# behavior (building a round's current deck, drawing, returning unused
# cards) lives on the subclasses.
var cards: Array[CardEntry] = []

func add_card(card_name: String, level: int = 1) -> CardEntry:
	var entry := CardEntry.new(card_name, level)
	cards.append(entry)
	return entry

func remove_card(instance_id: int) -> void:
	for i in range(cards.size()):
		if cards[i].instance_id == instance_id:
			cards.remove_at(i)
			return

func upgrade_card(instance_id: int, levels: int = 1) -> void:
	var entry := find_entry(instance_id)
	if entry:
		entry.level += levels

func find_entry(instance_id: int) -> CardEntry:
	for entry in cards:
		if entry.instance_id == instance_id:
			return entry
	return null

func card_count() -> int:
	return cards.size()
