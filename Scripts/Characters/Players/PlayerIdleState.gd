class_name PlayerIdleState extends PlayerStateBase

func get_state() -> Constants.States:
	return Constants.States.Idle

func get_animation_name() -> StringName:
	return Constants.Animations.Idle

func enter_state() -> void:
	super.enter_state()
	character_node.update_velocity(0.0)

func state_physics_process(delta: float) -> void:
	if character_node.direction != Vector2.ZERO:
		character_node.character_state_machine.switch_state(Constants.States.Move)
		return
	character_node.update_velocity(0.0)
	if not character_node.is_on_floor():
		character_node.apply_gravity(delta)
		character_node.move_and_slide()

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed(Constants.Inputs.Dash):
		character_node.character_state_machine.switch_state(Constants.States.Dash)
