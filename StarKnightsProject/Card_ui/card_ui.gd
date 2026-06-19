class_name CardUI
extends Control

signal reparent_requested(which_card_ui: CardUI)

@onready var color: ColorRect = $Color
@onready var state: Label = $State
@onready var drop_point_detector: Area2D = $DropPointDetector
@onready var card_state_machine: CardStateMachine = $CardStateMachine as CardStateMachine

var current_target: CardTarget = null

func _ready() -> void:
	card_state_machine.init(self)
	
func _input(event: InputEvent) -> void:
	card_state_machine.on_input(event)

func _on_gui_input(event: InputEvent) -> void:
	card_state_machine.on_gui_input(event)

func _on_mouse_entered() -> void:
	card_state_machine.on_mouse_entered()

func _on_mouse_exited() -> void:
	card_state_machine.on_mouse_exited()
	


func _on_drop_point_detector_area_entered(area: Area2D) -> void:
	if area is CardTarget:
		if area.can_accept_card(self) == true:
			current_target = area
			area.card_entered(self)
		else:
			return
	else:
		return

func _on_drop_point_detector_area_exited(area: Area2D) -> void:
	if area is CardTarget:
		if current_target == area:
			area.card_exited(self)
			current_target = null
		else:
			return
	else:
		return



#Card draw mechanics
func on_card_drawn() -> void:
	var card_data : CardData # will be set to a random card from the deck, this includes its level and type
	
