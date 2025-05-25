class_name EnemyStateMachine extends EnemyStateBase

@export var _current_state: EnemyStateBase
@export var _states: Array[EnemyStateBase]


func _ready():
	if _current_state == null:
		push_error("Current state is null")
	if _states == null or _states.size() == 0:
		push_error("States are not properly configured")
		return
	_current_state.notification(Constants.Notifications.EnterState)


func switch_state(target_type):
	for state in _states:
		if state.get_class() == target_type:
			_current_state.notification(Constants.Notifications.ExitState)
			_current_state = state
			_current_state.notification(Constants.Notifications.EnterState)
			break
