class_name EnemyStateBase extends Node

var character_node: Enemy = null


func get_state() -> Constants.States:
	return Constants.States.Idle


func get_animation_name() -> String:
	return Constants.Animations.None


func _ready():
	character_node = owner as Enemy
	state_ready()


func state_ready():
	set_physics_process(false) # Can be improved if needed
	set_process_input(false)


func _physics_process(delta):
	state_physics_process(delta)


func state_physics_process(_delta):
	pass


func _notification(what):
	process_notification(what)


func process_notification(what):
	if what == Constants.Notifications.EnterState:
		character_node.animation_enemy_node.play(get_animation_name())
		set_physics_process(true)
		set_process_input(true)
	elif what == Constants.Notifications.ExitState:
		set_physics_process(false)
		set_process_input(false)
