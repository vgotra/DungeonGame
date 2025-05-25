class_name PlayerMoveState extends PlayerStateBase

@export var _move_speed: float = 5.0

func get_state() -> Constants.States:
	return Constants.States.Move


func get_animation_name() -> String:
	return Constants.Animations.Move


func state_physics_process(_delta):
	if character_node.direction == Vector2.ZERO:
		character_node.state_machine.switch_state(Constants.States.Idle)
		return

	character_node.update_velocity(_move_speed)
	character_node.flip()
	character_node.move_and_slide()


func _input(_event):
	if Input.is_action_just_pressed(Constants.Inputs.Dash):
		character_node.state_machine.switch_state(Constants.States.Dash)
