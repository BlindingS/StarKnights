class_name PermanentDeck
extends Deck

# Persists between rounds. Edited directly by shop purchases, upgrades and
# removals, and by effects that need to sync a change made to a current-deck
# or hand card back onto its permanent original.

# Builds a fresh CurrentDeck for the start of a round: one entry per
# permanent card, each a separate CardEntry object sharing instance_id with
# its permanent original, so an in-round upgrade doesn't silently touch the
# permanent copy unless explicitly synced back via upgrade_card().
func build_current_deck() -> CurrentDeck:
	var current := CurrentDeck.new()
	for entry in cards:
		current.cards.append(CardEntry.new(entry.card_name, entry.level, entry.instance_id))
	return current
