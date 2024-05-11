extends Control

@onready var dialogue = $Dialogue
@onready var responses = $Responses
@onready var main_menu = $MainMenu
@onready var debug = $DEBUG
@onready var pause_menu = $pause_menu
@onready var options = $options



func _ready():
	# Input.set_mouse_mode(Input.MOUSE_MODE_CONFINED)
	pass

func _on_play_pressed():
	# Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	world.load_game()
	main_menu.hide()
	# get_tree().change_scene_to_file("res://Scenes/main_whatever_test.tscn")


func _on_options_pressed():
	toggle_element(options)
	
	if main_menu.is_visible():
		toggle_element(main_menu)
		options.current_menu = 0

	
	


func _on_exit_pressed():
	get_tree().quit()

	
func toggle_element(element:Node):
	if element.is_visible():
		element.set_visible(false)
	else:
		element.set_visible(true)
