@abstract class_name CharacterStateBase extends Node 

var character_node: Character = null

@abstract func get_state() -> Constants.States
@abstract func get_animation_name() -> String
@abstract func process_notification(what: int)
@abstract func set_state_ready(state: bool)
@abstract func state_physics_process(delta: float)

func _ready():
	character_node = owner as Character
	set_state_ready(false)

func _physics_process(delta: float):
	state_physics_process(delta)

func _notification(what: int):
	process_notification(what)
