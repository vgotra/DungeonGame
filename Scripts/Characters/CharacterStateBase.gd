@abstract class_name CharacterStateBase extends Node

var character_node: Character = null

@abstract func get_state() -> Constants.States
@abstract func get_animation_name() -> StringName
@abstract func state_physics_process(delta: float) -> void

func _ready() -> void:
	set_process_input(false)
	set_process_unhandled_input(false)
	set_state_active(false)

func initialize(character: Character) -> void:
	character_node = character
	set_state_active(false)

func set_state_active(active: bool) -> void:
	set_physics_process(active)

func enter_state() -> void:
	var animation_name := get_animation_name()
	if animation_name != Constants.Animations.None:
		character_node.character_animation_node.play(animation_name)
	set_state_active(true)

func exit_state() -> void:
	set_state_active(false)

func _physics_process(delta: float) -> void:
	state_physics_process(delta)
