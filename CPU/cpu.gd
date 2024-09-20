extends StaticBody2D

@export var speed = 600.0
@export var ball: Node2D


func _physics_process(delta: float) -> void:
	var velocity = Vector2.ZERO
	if ball.position.y > position.y + 50:
		velocity.y = 1
	elif ball.position.y < position.y - 50:
		velocity.y = -1
		
	velocity *= speed

	move_and_collide(velocity * delta)
