extends CharacterBody2D

var speed = 500.0

func _ready() -> void:
	# Random left or right
	if randi() % 2 == 0:
		velocity.x = 1
	else:
		velocity.x = -1
		
	# Random y angle
	velocity.y = randf_range(-0.5, 0.5)
	
	velocity *= speed	
	
func _physics_process(delta: float) -> void:
	
	var collision_info = move_and_collide(velocity * delta)
	
	if collision_info: #if collision happens
		velocity = velocity.bounce(collision_info.get_normal())
