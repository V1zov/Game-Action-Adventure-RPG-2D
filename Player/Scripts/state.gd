class_name State extends Node

# Store a reference to the player that this state belong to
static var player: player

func _ready() -> void:
	pass # Replace with function body.

# What happens when the player enter this state?
func Enter() -> void:
	pass

# What happens when the mplayer exit this state?
func Exit() -> void:
	pass

# What happens during the _process update in this state?
func Process( _delta : float) -> State:
	return null

# What happens during the _physics_process update in this state?
func Physics( _delta : float) -> State:
	return null

# What happens with input events in this state?
func HandleInput( _event : InputEvent) -> State:
	return null
