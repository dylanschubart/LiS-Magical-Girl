extends Node

var response_path: String = ""

var responses

var response_active = false

var response_array: Array 

var response_selected_index

var response_templog_path = "res://Scripts/Systems/response_system/templog.json"

func start_response(response_path_string: String, prompt: String = ""):

	var ui = get_tree().root.get_node("UI");

	if !response_active:
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		response_path = response_path_string
		ui.responses.show()
		response_array.append(ui.responses.response_1)
		response_array.append(ui.responses.response_2)
		response_array.append(ui.responses.response_3)
		response_array.append(ui.responses.response_4)
		#ui.responses.Prompt.text = prompt
		start()

	
func start():
	print_debug("start response")

	responses = getResponses()
	assert(responses, "No info found") 

	response_active = true

	showResponses()
 
func getResponses() -> Array:
	var f = FileAccess.open(response_path,FileAccess.READ)
	assert(FileAccess.file_exists(response_path), "File path does not exist")
	
	var json_object = JSON.new()
	json_object.parse(f.get_as_text())
	var output = json_object.get_data()
	
	if typeof(output) == TYPE_ARRAY:
		return output
	else:
		return []

func showResponses():
	assert(responses[1], "No Responses found")

	var count = 0;
	for response in responses[1]["responses"]:
		var label = response_array[count];
		
		print(label.text)
		label.text = response["text"]
		label.show();
		count += 1
		if count > 3:
			break;

func submitResponse():
	var f

	if FileAccess.file_exists(response_templog_path):
		f = FileAccess.open(response_templog_path, FileAccess.READ_WRITE)
		f.seek_end()
	else:
		f = FileAccess.open(response_templog_path, FileAccess.WRITE)

	f.store_line("Hello")
	f.close()

func _input(event):
	var ui = get_tree().root.get_node("UI")

	if response_active:
		#controller
		#option1
		if event.is_action_pressed("Left") and ui.responses.response_1.is_visible_in_tree():
			ui.responses.response_1.grab_focus()
			response_selected_index = 1
		if event.is_action_pressed("Interact_1") and ui.responses.response_1.is_visible_in_tree():
			ui.responses.response_1.grab_focus()
			response_selected_index = 1

		#option2
		if event.is_action_pressed("Right") and ui.responses.response_2.is_visible_in_tree():
			ui.responses.response_2.grab_focus()
			response_selected_index = 2
		if event.is_action_pressed("Interact_2") and ui.responses.response_2.is_visible_in_tree():
			ui.responses.response_2.grab_focus()
			response_selected_index = 2

		#option3
		if event.is_action_pressed("Forward") and ui.responses.response_3.is_visible_in_tree():
			ui.responses.response_3.grab_focus()
			response_selected_index = 3
		if event.is_action_pressed("Interact_3") and ui.responses.response_2.is_visible_in_tree():
			ui.responses.response_3.grab_focus()
			response_selected_index = 3

		#option4
		if event.is_action_pressed("Backward") and ui.responses.response_4.is_visible_in_tree():
			ui.responses.response_4.grab_focus()
			response_selected_index = 4
		if event.is_action_pressed("Interact_4") and ui.responses.response_4.is_visible_in_tree():
			ui.responses.response_4.grab_focus()
			response_selected_index = 4

		#kb&mouse
		if event is InputEventMouseButton:
			if event.button_index == 1:
				if event.is_pressed():
					Input.set_mouse_mode(Input.MOUSE_MODE_CONFINED)
				if event.is_released():
					Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
					print("released")
					if get_focussed():
						print("released and has focus")
						submitResponse()
			
func get_focussed():
	var ui = get_tree().root.get_node("UI");

	if ui.responses.response_1.has_focus():
		response_selected_index = 1
		return true
	if ui.responses.response_2.has_focus():
		response_selected_index = 2
		return true
	if ui.responses.response_3.has_focus():
		response_selected_index = 3
		return true
	if ui.responses.response_4.has_focus():
		response_selected_index = 4
		return true

	return false
