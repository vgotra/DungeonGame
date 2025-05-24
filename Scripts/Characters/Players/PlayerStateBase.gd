class_name PlayerStateBase extends Node

var character_node: Player = null

func get_animation_name() -> String:
	return Animations.None


func _ready():
	character_node = owner as Player
	state_ready()


func state_ready():
	set_physics_process(false) # Can be improved if needed
	set_process_input(false)


func _physics_process(delta):
	state_physics_process(delta)


func state_physics_process(delta):
	pass


func _notification(what):
	process_notification(what)


func process_notification(what):
	if what == Notifications.EnterState:
		character_node.animation_player_node.play(get_animation_name())
		set_physics_process(true)
		set_process_input(true)
	elif what == Notifications.ExitState:
		set_physics_process(false)
		set_process_input(false)
