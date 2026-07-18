class_name CharacterDatabase
extends Node

# Unlike cards (where several cards share one class, e.g. BlastCard, and
# differ only by data in CardDatabase's dictionaries), every character has
# its own class that configures its own stats and art in its own _init().
# This is just a name -> class lookup.
func create_character(character_name: String) -> Character:
	match character_name:
		"Blaster":
			return BlasterCharacter.new()

	push_error("Character not found: " + character_name)
	return null
