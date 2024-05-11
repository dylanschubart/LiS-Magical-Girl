extends Node

var response_path: String = ""

var responses

var response_active = false

var response_array: Array 

var response_selected_index;

func start_response(response_path_string: String, prompt: String = ""):

	var ui = get_tree().root.get_node("UI");

	if !response_active:
		response_path = response_path_string
		ui.responses.show()
		response_array.append(ui.responses.response_1)
		response_array.append(ui.responses.response_2)
		response_array.append(ui.responses.response_3)
		response_array.append(ui.responses.response_4)
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
	print(responses[1]["responses"])
	var count = 0;
	for response in responses[1]["responses"]:
		var label = response_array[count];
		
		print(label.text)
		label.text = response["text"]
		label.show();
		count += 1
		if count > 3:
			break;

func _input(event):
	var ui = get_tree().root.get_node("UI");

	#if response_active:
	if event.is_action_pressed("Forward") and ui.responses.response_3.is_visible_in_tree():
		ui.responses.response_3.grab_focus()
		response_selected_index = 3 
		pass
	if event.is_action_pressed("Backward") and ui.responses.response_4.is_visible_in_tree():
		ui.responses.response_4.grab_focus()
		response_selected_index = 4
		pass
	if event.is_action_pressed("Left") and ui.responses.response_1.is_visible_in_tree():
		ui.responses.response_1.grab_focus()
		response_selected_index = 1
		pass
	if event.is_action_pressed("Right") and ui.responses.response_2.is_visible_in_tree():
		ui.responses.response_2.grab_focus()
		response_selected_index = 2 
		pass

