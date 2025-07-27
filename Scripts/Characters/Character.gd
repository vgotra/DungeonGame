@abstract class_name Character extends CharacterBody3D

@export var sprite_3d_node: Sprite3D
@export var character_animation_node: AnimationPlayer
@export var is_inverse_movement: bool = false
@export var character_state_machine: CharacterStateMachine

var direction: Vector2 = Vector2.ZERO

func _ready():
	if character_animation_node == null:
		push_error("character_animation_node is null")
	if sprite_3d_node == null:
		push_error("sprite_3d_node is null")
	if character_state_machine == null:
		push_error("character_state_machine is null")

func flip() -> void:
	if velocity.x == 0:
		return
	sprite_3d_node.flip_h = velocity.x < 0
