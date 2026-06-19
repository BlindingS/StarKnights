class_name CardTarget
extends Area2D

@export var accepting: bool = true

func can_accept_card(card: CardUI) -> bool:
	return accepting
	#Can be changed to only accept certain cards

func on_card_dropped(card: CardUI) -> void:
	pass
	
func card_entered(card: CardUI) -> void:
	pass

func card_exited(card: CardUI) -> void:
	pass
