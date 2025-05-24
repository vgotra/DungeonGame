class_name PlayerStateMachine extends Node

@export var _current_state: PlayerStateBase
@export var _states: Array[PlayerStateBase]


func _ready():
	if _current_state == null:
		push_error("Current state is null")
	if _states == null or _states.size() == 0:
		push_error("PlayerStateMachine is not properly configured")
		return
	_current_state.notification(Notifications.EnterState)


func switch_state(target_class):
	for state in _states:
		if state.get_class() == target_class.get_class(): # check this
			_current_state.notification(Notifications.ExitState)
			_current_state = state
			_current_state.notification(Notifications.EnterState)
			break
