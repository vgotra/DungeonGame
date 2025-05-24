class_name PlayerIdleState extends PlayerStateBase

func get_animation_name() -> String:
	return Animations.Idle


func state_physics_process(delta):
	character_node.velocity = Vector3.ZERO
	if character_node.direction != Vector2.ZERO:
		character_node.state_machine.switch_state(PlayerMoveState)


func _input(event):
	if Input.is_action_just_pressed(Inputs.Dash):
		character_node.state_machine.switch_state(PlayerDashState)
