class_name EnemyReturnState extends EnemyStateBase

@export var _move_speed: float = 3.0
@export var _stopping_distance: float = 0.15

var destination: Vector3 = Vector3.ZERO

func get_state() -> Constants.States:
	return Constants.States.Move

func get_animation_name() -> StringName:
	return Constants.Animations.Move

func enter_state() -> void:
	if enemy_node == null or enemy_node.path_node == null or enemy_node.path_node.curve == null or enemy_node.path_node.curve.point_count == 0:
		character_node.character_state_machine.switch_state(Constants.States.Idle)
		return
	var local_point := enemy_node.path_node.curve.get_point_position(0)
	destination = enemy_node.path_node.to_global(local_point)
	super.enter_state()

func state_physics_process(delta: float) -> void:
	var offset := destination - character_node.global_position
	offset.y = 0.0
	if offset.length_squared() <= _stopping_distance * _stopping_distance:
		character_node.direction = Vector2.ZERO
		character_node.update_velocity(0.0)
		character_node.character_state_machine.switch_state(Constants.States.Idle)
		return
	var move_dir := offset.normalized()
	character_node.direction = Vector2(move_dir.x, move_dir.z)
	character_node.apply_gravity(delta)
	character_node.update_velocity(_move_speed)
	character_node.flip()
	character_node.move_and_slide()
