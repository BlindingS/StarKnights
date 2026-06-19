class_name EnemyCardTarget
extends CardTarget


func card_entered(card: CardUI) -> void:
	combatent.set_targeted(true)

func card_exited(card: CardUI) -> void:
	combatent.set_targeted(false)
