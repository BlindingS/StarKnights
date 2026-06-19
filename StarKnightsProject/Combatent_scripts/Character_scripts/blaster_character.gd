class_name BlasterCharacter
extends Character

func modify_damage(amount: int, card: CardData, owner: Combatent) -> int:
	if card is BlastCard and owner == self:
		return amount * 2
	return amount
