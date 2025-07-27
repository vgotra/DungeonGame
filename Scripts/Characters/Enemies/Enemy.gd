class_name Enemy extends Character

func _input(_event):
	if is_inverse_movement:
		direction = Input.get_vector(Constants.Inputs.MoveLeft, Constants.Inputs.MoveRight, Constants.Inputs.MoveBackward, Constants.Inputs.MoveForward)
	else:
		direction = Input.get_vector(Constants.Inputs.MoveLeft, Constants.Inputs.MoveRight, Constants.Inputs.MoveForward, Constants.Inputs.MoveBackward)

func update_velocity(movement_speed: float) -> void:
	velocity = Vector3(direction.x, 0, direction.y)
	if velocity == Vector3.ZERO:
		velocity = Vector3.LEFT if sprite_3d_node.flip_h else Vector3.RIGHT
	velocity *= movement_speed
