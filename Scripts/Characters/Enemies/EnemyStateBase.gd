@abstract class_name EnemyStateBase extends CharacterStateBase

func get_state() -> Constants.States:
	return Constants.States.Idle

func get_animation_name() -> String:
	return Constants.Animations.None

func set_state_ready(state: bool):
	set_physics_process(state) # Can be improved if needed
	set_process_input(state)

func process_notification(what: int):
	if what == Constants.Notifications.EnterState:
		character_node.character_animation_node.play(get_animation_name())
		set_state_ready(true)
	elif what == Constants.Notifications.ExitState:
		set_state_ready(false)
