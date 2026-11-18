@abstract class_name Character extends CharacterBody3D

@export_group("Required Nodes")
@export var sprite_3d_node: Sprite3D
@export var character_animation_node: AnimationPlayer
@export var is_inverse_movement: bool = false
@export var character_state_machine: CharacterStateMachine

var direction: Vector2 = Vector2.ZERO

func _ready() -> void:
	var has_missing_nodes := false
	if character_animation_node == null:
		push_error("character_animation_node is null")
		has_missing_nodes = true
	if sprite_3d_node == null:
		push_error("sprite_3d_node is null")
		has_missing_nodes = true
	if character_state_machine == null:
		push_error("character_state_machine is null")
		has_missing_nodes = true
	if has_missing_nodes:
		return
	character_state_machine.initialize(self)

func apply_gravity(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta

func update_velocity(movement_speed: float, use_facing_when_zero: bool = false) -> void:
	var move_dir := Vector3(direction.x, 0.0, direction.y)
	if move_dir == Vector3.ZERO and use_facing_when_zero:
		move_dir = Vector3.LEFT if sprite_3d_node.flip_h else Vector3.RIGHT
	velocity.x = move_dir.x * movement_speed
	velocity.z = move_dir.z * movement_speed

func flip() -> void:
	if is_zero_approx(velocity.x):
		return
	sprite_3d_node.flip_h = velocity.x < 0.0
