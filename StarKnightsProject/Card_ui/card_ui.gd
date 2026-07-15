class_name CardUI
extends Control

signal reparent_requested(which_card_ui: CardUI)

@onready var color: ColorRect = $Color
@onready var state: Label = $State
@onready var info: Label = $Info
@onready var drop_point_detector: Area2D = $DropPointDetector
@onready var card_state_machine: CardStateMachine = $CardStateMachine as CardStateMachine

var current_target: CardTarget = null
var card_data: CardData = null

func _ready() -> void:
	card_state_machine.init(self)

# Called by whoever draws this card (e.g. Hand) right after instancing this scene.
func setup(new_card_data: CardData) -> void:
	card_data = new_card_data
	card_data.level_changed.connect(_on_level_changed)
	_update_info()

func _on_level_changed(_new_level: int) -> void:
	_update_info()

func _update_info() -> void:
	info.text = "%s\nLv%d  Arms:%d" % [card_data.card_name, card_data.level, card_data.arms_needed]

func _exit_tree() -> void:
	if card_data and card_data.level_changed.is_connected(_on_level_changed):
		card_data.level_changed.disconnect(_on_level_changed)

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
