extends Control


var paused = false


func _process(_delta):

	# Exit game when Press ESC (or binded button to "quit")
	if Input.is_action_just_pressed("Quit"):
		pauseMenu()


func pauseMenu():

	var player = get_tree().get_first_node_in_group("Player")
	
	if paused:
		self.hide()
		Engine.time_scale = 1
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		# Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		player.disabled_input = false
	else:
		self.show()
		Engine.time_scale = 0
		Input.set_mouse_mode(Input.MOUSE_MODE_CONFINED)
		player.disabled_input = true


	paused = !paused

