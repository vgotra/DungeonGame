class_name Player extends Character

func _physics_process(_delta: float) -> void:
	direction = Input.get_vector(
		Constants.Inputs.MoveLeft,
		Constants.Inputs.MoveRight,
		Constants.Inputs.MoveForward,
		Constants.Inputs.MoveBackward
	)
	if is_inverse_movement:
		direction = -direction
