extends Control

@onready var dialogue = $Dialogue
@onready var responses = $Responses
@onready var main_menu = $MainMenu
@onready var debug = $DEBUG
@onready var pause_menu = $pause_menu


func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CONFINED)

func _on_play_pressed():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	world.load_game()
	main_menu.hide()
	# get_tree().change_scene_to_file("res://Scenes/main_whatever_test.tscn")


func _on_options_pressed():
	pass # Replace with function body.


func _on_exit_pressed():
	get_tree().quit()
