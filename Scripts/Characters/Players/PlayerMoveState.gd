class_name PlayerMoveState extends PlayerStateBase

@export var _move_speed: float = 5.0

func get_animation_name() -> String:
	return Animations.Move


func state_physics_process(delta):
	if character_node.direction == Vector2.ZERO:
		character_node.state_machine.switch_state(PlayerIdleState)
		return

	character_node.update_velocity(_move_speed)
	character_node.flip()
	character_node.move_and_slide()


func _input(event):
	if Input.is_action_just_pressed(Inputs.Dash):
		character_node.state_machine.switch_state(PlayerDashState)
