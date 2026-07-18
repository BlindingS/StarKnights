class_name BlasterCharacter
extends Character

func _init() -> void:
	setup({
		"name": "Blaster",
		"max_hp": 30,
		"arm_number": 2,
		"art": preload("res://Sprite_art/Character_art/blaster.png"),
	})

func modify_damage(amount: int, card: CardData, owner: Combatent) -> int:
	if card is BlastCard and owner == self:
		return amount * 2
	return amount
