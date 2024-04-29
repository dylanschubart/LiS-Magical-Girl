extends Control

# Start Game
func _on_play_pressed():
	get_tree().change_scene_to_file("res://Scenes/main_whatever_test.tscn")

# Options
func _on_options_pressed():
	pass # Replace with function body.

# Exit Game
func _on_exit_pressed():
	get_tree().quit()
