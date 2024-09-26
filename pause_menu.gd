extends Control


func _process(delta: float) -> void:
	if Input.is_action_just_pressed("escape") and get_tree().paused == true:
		resume()
	elif Input.is_action_just_pressed("escape") and get_tree().paused == false:
		pause()
		%Resume.grab_focus()

func _on_resume_pressed() -> void:
	resume()
	get_tree().paused = false

func _on_restart_pressed() -> void:
	get_tree().reload_current_scene()
	

func _on_quit_pressed() -> void:
	get_tree().change_scene_to_file("res://main_menu.tscn")

func resume():
	get_tree().paused = false
	self.hide()
	

func pause():
	get_tree().paused = true
	self.show()
