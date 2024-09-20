extends Node2D

@export var ball: Node2D
@export var player: Node2D
@export var cpu: Node2D
@export var player_score_label: Label
@export var cpu_score_label: Label

const  CENTER = Vector2(640, 450)

var player_score: int = 0
var cpu_score: int = 0


func _process(delta: float) -> void:
	if Input.is_action_just_pressed("pause"):
		get_tree().paused = true
		print("pause")


func _on_area_left_body_entered(body: Node2D) -> void:
	reset()
	player_score += 1
	player_score_label.text = "Player: " + str(player_score)

func _on_area_right_body_entered(body: Node2D) -> void:
	reset()
	cpu_score += 1
	cpu_score_label.text = "CPU: " + str(cpu_score)

func reset():
	ball.velocity = Vector2.ZERO
	ball.position = CENTER 
	player.position.y = CENTER.y
	cpu.position.y = CENTER.y

	ball.ball_start_direction()
