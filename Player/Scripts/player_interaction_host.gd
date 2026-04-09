class_name player_interaction_host extends Node2D

@onready var player: player = $".."
@onready var collision_shape_2d_2: CollisionShape2D = $HurtBox/CollisionShape2D2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player.DirectionChanged.connect(UpdateDirection)
	pass # Replace with function body.

func UpdateDirection(new_diirection : Vector2) -> void:
	match new_diirection:
		Vector2.DOWN:
			rotation_degrees = 0
			position = Vector2(0, 0)
			collision_shape_2d_2.shape.size =  Vector2(39.75, 14)
			collision_shape_2d_2.position = Vector2(0, -9)
		Vector2.UP:
			rotation_degrees = 180
			position = Vector2(0, -29)
			collision_shape_2d_2.shape.size =  Vector2(39.74, 30)
			collision_shape_2d_2.position = Vector2(0, -21)
		Vector2.LEFT:
			rotation_degrees = 90
			position = Vector2(-16, -18)
			collision_shape_2d_2.shape.size =  Vector2(39.74, 20)
			collision_shape_2d_2.position = Vector2(0, -12)
		Vector2.RIGHT:
			rotation_degrees = -90
			position = Vector2(16, -18)
			collision_shape_2d_2.shape.size =  Vector2(39.74, 20)
			collision_shape_2d_2.position = Vector2(0, -12)
		_:
			rotation_degrees = 0
	pass
