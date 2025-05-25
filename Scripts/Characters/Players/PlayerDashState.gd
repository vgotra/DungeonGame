class_name PlayerDashState extends PlayerStateBase

@export var dash_timer_node: Timer
@export var dash_speed: float = 10.0

func get_state() -> Constants.States:
	return Constants.States.Dash


func get_animation_name() -> String:
	return Constants.Animations.Dash


func state_ready():
	dash_timer_node.timeout.connect(_on_dash_timeout)


func _on_dash_timeout():
	character_node.state_machine.switch_state(Constants.States.Idle)


func process_notification(what):
	if what == Constants.Notifications.EnterState:
		character_node.animation_player_node.play(get_animation_name())
		character_node.update_velocity(dash_speed)
		dash_timer_node.start()


func state_physics_process(_delta):
	character_node.flip()
	character_node.move_and_slide()
