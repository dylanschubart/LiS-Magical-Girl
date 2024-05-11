extends Control



var paused = false
var ui

func _ready():

	ui = get_parent()


func _process(_delta):

	# Exit game when Press ESC (or binded button to "quit")
	if Input.is_action_just_pressed("Quit"):
		pauseMenu()


func pauseMenu():

	var player = get_tree().get_first_node_in_group("Player")
	
	if paused:
		self.hide()
		Engine.time_scale = 1
		# Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		player.disabled_input = false
	else:
		self.show()
		Engine.time_scale = 0
		# Input.set_mouse_mode(Input.MOUSE_MODE_CONFINED)
		player.disabled_input = true


	paused = !paused
	


func _on_resume_pressed():
	pauseMenu()


func _on_options_pressed():
	ui.toggle_element(ui.options)
	
	if ui.pause_menu.is_visible():
		ui.toggle_element(ui.pause_menu)
		ui.options.current_menu = 1


func _on_back_to_windows_pressed():
	get_tree().quit()
