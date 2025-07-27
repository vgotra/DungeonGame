class_name EnemyIdleState extends EnemyStateBase

func get_state() -> Constants.States:
	return Constants.States.Idle #TODO Add statuses/modes of characters

func get_animation_name() -> String:
	return Constants.Animations.Idle

func state_physics_process(_delta: float):
	pass
