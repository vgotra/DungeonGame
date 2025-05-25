class_name Enemy extends CharacterBody3D

@export var sprite_3d_node: Sprite3D
@export var animation_enemy_node: AnimationPlayer
@export var is_inverse_movement: bool = false
@export var enemy_state_machine: EnemyStateMachine

var direction: Vector2 = Vector2.ZERO


func _ready():
	if animation_enemy_node == null:
		push_error("animation_enemy_node is null")
	if sprite_3d_node == null:
		push_error("sprite_3d_node is null")
	if enemy_state_machine == null:
		push_error("enemystate_machine is null")


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


func flip() -> void:
	if velocity.x == 0:
		return
	sprite_3d_node.flip_h = velocity.x < 0
