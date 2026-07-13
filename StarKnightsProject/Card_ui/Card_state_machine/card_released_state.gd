extends CardState

func enter() -> void:
	if card_ui.current_target == null:
		transition_requested.emit(self, CardState.State.BASE)
		return

	card_ui.color.color = Color.GRAY
	card_ui.state.text = "RELEASED"
