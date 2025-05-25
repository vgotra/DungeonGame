class_name PlayerIdleState extends PlayerStateBase

func get_state() -> Constants.States:
	return Constants.States.Idle


func get_animation_name() -> String:
	return Constants.Animations.Idle


func state_physics_process(_delta):
	character_node.velocity = Vector3.ZERO
	if character_node.direction != Vector2.ZERO:
		character_node.state_machine.switch_state(Constants.States.Move)


func _input(_event):
	if Input.is_action_just_pressed(Constants.Inputs.Dash):
		character_node.state_machine.switch_state(Constants.States.Dash)
