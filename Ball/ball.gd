extends CharacterBody2D

@export var collision_sound: AudioStreamPlayer
var speed = 500.0

func _ready() -> void:
	ball_start_direction()
	
func _physics_process(delta: float) -> void:
	
	var collision_info = move_and_collide(velocity * delta)
	
	if collision_info: #if collision happens
		velocity = velocity.bounce(collision_info.get_normal())
		collision_sound.play()

func ball_start_direction():
	# Random left or right
	if randi() % 2 == 0:
		velocity.x = 1
	else:
		velocity.x = -1

	velocity.y = randf_range(-1, 1)
	velocity *= speed
	
	
