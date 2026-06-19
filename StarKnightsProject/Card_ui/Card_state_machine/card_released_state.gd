extends CardState

func enter() -> void:
	card_ui.color.color = Color.GRAY
	card_ui.state.text = "RELEASED"
