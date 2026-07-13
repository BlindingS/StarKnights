class_name CurrentDeck
extends Deck

# Only exists for the current round. Entries leave it when drawn (as real
# CardData) and come back when an unused hand card is returned at end of turn.

# Removes up to `amount` random entries from the deck and returns real
# CardData instances built from them (hand/UI/play need the full fields).
func draw(amount: int) -> Array[CardData]:
	var pool := cards.duplicate()
	pool.shuffle()

	var chosen: Array[CardEntry] = []
	for i in range(min(amount, pool.size())):
		chosen.append(pool[i])

	for entry in chosen:
		cards.erase(entry)

	var drawn: Array[CardData] = []
	for entry in chosen:
		drawn.append(_materialize(entry))

	return drawn

# Call at end of turn for every hand card that was not played. Converts the
# live CardData back down into a lightweight entry in the deck.
func return_unused(unused_cards: Array[CardData]) -> void:
	for card in unused_cards:
		cards.append(CardEntry.new(card.card_name, card.level, card.instance_id))

func _materialize(entry: CardEntry) -> CardData:
	var card := card_database.create_card(entry.card_name)
	card.level = entry.level
	card.instance_id = entry.instance_id
	return card
