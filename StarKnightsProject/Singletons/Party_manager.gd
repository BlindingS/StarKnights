class_name PartyManager
extends Node

# Persists for the whole run: the permanent deck and the recruited roster,
# both of which survive from round to round (unlike BattleManager's
# player_team/enemy_team, which are scoped to a single battle).
var permanent_deck: PermanentDeck = PermanentDeck.new()
var current_deck: CurrentDeck = CurrentDeck.new()
var characters: Array[Character] = []

func add_character(character: Character) -> void:
	characters.append(character)

func remove_character(character: Character) -> void:
	characters.erase(character)

func is_party_wiped() -> bool:
	if characters.is_empty():
		return true

	for character in characters:
		if character.current_hp > 0:
			return false

	return true

func revive_and_heal_all() -> void:
	for character in characters:
		character.current_hp = character.max_hp

# Call once a battle is won, before the next one starts. Revives and fully
# heals the whole roster and refreshes the current deck from the permanent
# deck. Returns false without changing anything if the party was wiped —
# that's a loss, not a round transition.
func start_new_round() -> bool:
	if is_party_wiped():
		return false

	revive_and_heal_all()
	current_deck = permanent_deck.build_current_deck()
	return true
