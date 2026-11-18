@abstract class_name PlayerStateBase extends CharacterStateBase

var player_node: Player:
	get:
		return character_node as Player

func set_state_active(active: bool) -> void:
	super.set_state_active(active)
	set_process_unhandled_input(active)
