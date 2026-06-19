class_name CardStateMachine
extends Node

@export var initial_state: CardState #This is a class defined elsewhere in the code

var current_state: CardState
var states := {}

func init(card: CardUI) -> void:
	for child in get_children():
		if child is CardState:
			states[child.state] = child
			child.transition_requested.connect(_on_transition_requested)
			child.card_ui = card

	if initial_state:
		current_state = initial_state
		current_state.enter()

func on_input(event: InputEvent) -> void:
	if current_state:
		current_state.on_input(event)

func on_gui_input(event: InputEvent) -> void:
	if current_state:
		current_state.on_gui_input(event)

func on_mouse_entered() -> void:
	if current_state:
		current_state.on_mouse_entered()

func on_mouse_exited() -> void:
	if current_state:
		current_state.on_mouse_exited()

func _on_transition_requested(from: CardState, to: CardState.State) -> void:
	if from != current_state:
		return
		
	var new_state: CardState = states[to]
	if new_state == null:
		return
	
	if current_state:
		current_state.exit()
	
	current_state = new_state
	current_state.enter()
