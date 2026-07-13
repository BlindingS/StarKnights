class_name CardId
extends RefCounted

# Shared id source for CardData and CardEntry so a card's identity survives
# being materialized/dematerialized between the two representations.
static var _next_id: int = 0

static func generate() -> int:
	_next_id += 1
	return _next_id
