class_name PlayerStateMachine extends Node

@export var _current_state: PlayerStateBase
@export var _states: Array[PlayerStateBase]


func _ready():
	if _current_state == null:
		push_error("Current state is null")
	if _states == null or _states.size() == 0:
		push_error("States are not properly configured")
		return
	_current_state.notification(Constants.Notifications.EnterState)


func switch_state(state_value: Constants.States):
	for state in _states:
		if state.get_state() == state_value:
			_current_state.notification(Constants.Notifications.ExitState)
			_current_state = state
			_current_state.notification(Constants.Notifications.EnterState)
			break
