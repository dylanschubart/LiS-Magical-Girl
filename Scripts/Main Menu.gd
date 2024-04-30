extends Control

@onready var dialogue = $Dialogue

func _on_play_pressed():
	world.load_game()
	self.hide()
	# get_tree().change_scene_to_file("res://Scenes/main_whatever_test.tscn")


func _on_options_pressed():
	pass # Replace with function body.


func _on_exit_pressed():
	get_tree().quit()
