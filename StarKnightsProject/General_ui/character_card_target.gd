class_name CharacterCardTarget
extends CardTarget

@export var character_ui: CharacterUI

func _ready() -> void:
	character_ui = get_parent() as CharacterUI #This obtains the combatent node

func card_entered(card: CardUI) -> void:
	character_ui.set_targeted(true)

func card_exited(card: CardUI) -> void:
	character_ui.set_targeted(false)
