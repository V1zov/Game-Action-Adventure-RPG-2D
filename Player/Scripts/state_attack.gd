class_name state_attack extends State

var attacking : bool = false

@export var attack_sound: AudioStream
@export_range(1,20,0.5) var decelerate_speed : float = 5.0

@onready var animation_player: AnimationPlayer = $"../../AnimationPlayer"
@onready var attackk_animation: AnimationPlayer = $"../../Sprite2D/AttackEffectSprite/AnimationPlayer"
@onready var walk: State = $"../walk"
@onready var idle: State = $"../idle"
@onready var audio: AudioStreamPlayer2D = $"../../audio/AudioStreamPlayer2D"

# What happens when the player enter this state?
func Enter() -> void:
	player.UpdateAnimation("attack")
	attackk_animation.play("attack_" + player.AnimDirection())
	animation_player.animation_finished.connect(EndAttack)
	audio.stream = attack_sound
	audio.pitch_scale = randf_range(0.8, 1.2)
	audio.play()
	attacking = true
	pass

# What happens when the mplayer exit this state?
func Exit() -> void:
	animation_player.animation_finished.disconnect(EndAttack)
	attacking = false
	pass

# What happens during the _process update in this state?
func Process( _delta : float) -> State:
	player.velocity -= player.velocity * decelerate_speed * _delta
	if attacking == false:
		if player.direction == Vector2.ZERO:
			return idle
		else:
			return walk
	return null

# What happens during the _physics_process update in this state?
func Physcs( _delta : float) -> State:
	return null

# What happens with input events in this state?
func HandleInput( _event : InputEvent) -> State:
	return null

func EndAttack(_newAnimName : String) -> void:
	attacking = false
