class_name state_idle extends State

@onready var walk: State = $"../walk"
@onready var attack: State = $"../attack"

# What happens when the player enter this state?
func Enter() -> void:
	player.UpdateAnimation("idle")
	pass

# What happens when the mplayer exit this state?
func Exit() -> void:
	pass

# What happens during the _process update in this state?
func Process( _delta : float) -> State:
	if player.direction != Vector2.ZERO:
		return walk
	player.velocity = Vector2.ZERO
	return null

# What happens during the _physics_process update in this state?
func Physcs( _delta : float) -> State:
	return null

# What happens with input events in this state?
func HandleInput( _event : InputEvent) -> State:
	if _event.is_action_pressed("attack"):
		return attack
	return null
