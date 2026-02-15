class_name EnemyReturnState extends EnemyStateBase

var destination: Vector3

func get_state() -> Constants.States:
	return Constants.States.Move #TODO Add statuses/modes of characters

func get_animation_name() -> String:
	return Constants.Animations.Move

func _ready():
	super._ready()
	var local_position = character_node.path_node.curve.get_point_position(0)
	var global_position = character_node.path_node.global_position
	destination = local_position + global_position

func state_physics_process(_delta: float):
	character_node.global_position = destination
