extends Node2D

@export var ball: Node2D
@export var player: Node2D
@export var cpu: Node2D
@export var player_score_label: Label
@export var cpu_score_label: Label
@onready var reset_timer_label: Label = %Reset_timer
@onready var reset_fade_background: ColorRect = %Reset_fade_background

@onready var timer: Timer = $Timer



const  CENTER = Vector2(640, 450)
var player_score: int = 0
var cpu_score: int = 0

func _ready() -> void:
	pass
	reset_fade_background.hide()
	
	
func _process(delta: float) -> void:
	
	var time_left: int  = int(timer.time_left)
	reset_timer_label.text = str(time_left + 1)


func _on_area_left_body_entered(body: Node2D) -> void:
	timer.start()
	player_score += 1
	player_score_label.text = "Player: " + str(player_score)
	reset()

func _on_area_right_body_entered(body: Node2D) -> void:
	timer.start()
	cpu_score += 1
	cpu_score_label.text = "CPU: " + str(cpu_score)
	reset()

	
func reset():
	reset_fade_background.show()
	
	player.position.y = CENTER.y
	ball.position = CENTER 
	cpu.position.y = CENTER.y
	ball.velocity = Vector2.ZERO
	
	await timer.timeout
	
	reset_fade_background.hide()
		
	ball.ball_start_direction()
