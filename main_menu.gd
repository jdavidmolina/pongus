extends Control


func _ready() -> void:
	$Button_start.grab_focus()


func _on_button_start_pressed() -> void:
	get_tree().change_scene_to_file("res://main.tscn")

func _on_button_quit_pressed() -> void:
	get_tree().quit()
