class_name PlayerDashState extends PlayerStateBase

@export var dash_timer_node: Timer
@export var dash_speed: float = 10.0

func _ready() -> void:
	super._ready()
	if dash_timer_node == null:
		push_error("dash_timer_node is null")
		return
	dash_timer_node.timeout.connect(_on_dash_timeout)

func get_state() -> Constants.States:
	return Constants.States.Dash

func get_animation_name() -> StringName:
	return Constants.Animations.Dash

func enter_state() -> void:
	super.enter_state()
	character_node.update_velocity(dash_speed, true)
	if dash_timer_node != null:
		dash_timer_node.start()

func exit_state() -> void:
	if dash_timer_node != null and not dash_timer_node.is_stopped():
		dash_timer_node.stop()
	super.exit_state()

func _on_dash_timeout() -> void:
	var next_state := Constants.States.Move if character_node.direction != Vector2.ZERO else Constants.States.Idle
	character_node.character_state_machine.switch_state(next_state)

func state_physics_process(delta: float) -> void:
	character_node.apply_gravity(delta)
	character_node.flip()
	character_node.move_and_slide()
