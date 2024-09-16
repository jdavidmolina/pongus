extends StaticBody2D

@export var speed = 600.0

func _physics_process(delta: float) -> void:
	
	var velocity = Vector2.ZERO
	
	if Input.is_action_pressed("move_down"):
		velocity.y += speed
	elif Input.is_action_pressed("move_up"):
		velocity.y -= speed
	move_and_collide(velocity * delta)
