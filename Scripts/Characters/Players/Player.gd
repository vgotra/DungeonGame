class_name Player extends CharacterBody3D

@export var sprite_3d_node: Sprite3D
@export var animation_player_node: AnimationPlayer
@export var is_inverse_movement: bool = false
@export var state_machine: Node

var direction: Vector2 = Vector2.ZERO


func _ready():
	if animation_player_node == null:
		push_error("animation_player_node is null")
	if sprite_3d_node == null:
		push_error("sprite_3d_node is null")
	if state_machine == null:
		push_error("state_machine is null")


func _input(event):
	if is_inverse_movement:
		direction = Input.get_vector(Inputs.MoveLeft, Inputs.MoveRight, Inputs.MoveBackward, Inputs.MoveForward)
	else:
		direction = Input.get_vector(Inputs.MoveLeft, Inputs.MoveRight, Inputs.MoveForward, Inputs.MoveBackward)


func update_velocity(movement_speed: float) -> void:
	velocity = Vector3(direction.x, 0, direction.y)
	if velocity == Vector3.ZERO:
		velocity = sprite_3d_node.flip_h if Vector3.LEFT else Vector3.RIGHT
	velocity *= movement_speed


func flip() -> void:
	if velocity.x == 0:
		return
	sprite_3d_node.flip_h = velocity.x < 0
