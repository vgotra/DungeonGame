extends "res://Scripts/Characters/Players/PlayerStateBase.gd"

const PlayerIdleState = preload("res://Scripts/Characters/Players/PlayerIdleState.gd")

@export var dash_timer_node: Timer
@export var dash_speed: float = 10.0


func state_ready():
	dash_timer_node.timeout.connect(_on_dash_timeout)


func _on_dash_timeout():
	character_node.state_machine.switch_state(PlayerIdleState)


func process_notification(what):
	if what == Notifications.EnterState:
		character_node.animation_player_node.play(animation_name)
		character_node.update_velocity(dash_speed)
		dash_timer_node.start()


func state_physics_process(delta):
	character_node.flip()
	character_node.move_and_slide()
