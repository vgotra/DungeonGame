@abstract class_name CharacterStateMachine extends Node

@export var _current_state: CharacterStateBase
@export var _states: Array[CharacterStateBase]

func initialize(character: Character) -> void:
	if _states.is_empty():
		push_error("States are not properly configured")
		return
	for state in _states:
		if state != null:
			state.initialize(character)
	if _current_state == null:
		push_error("Current state is null")
		return
	_current_state.enter_state()

func switch_state(state_value: Constants.States) -> void:
	if _current_state != null and _current_state.get_state() == state_value:
		return
	for state in _states:
		if state != null and state.get_state() == state_value:
			if _current_state != null:
				_current_state.exit_state()
			_current_state = state
			_current_state.enter_state()
			return
	push_warning("State %s not found in %s" % [state_value, name])
