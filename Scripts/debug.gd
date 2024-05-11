extends MarginContainer

@onready var test_label: Label = $VBoxContainer/TestResource

func _on_save_pressed():
	if world.save.save_exists():
		world.save.save_game()
	else:
		world.save.example_data = test_label.example_data
		world.save.save_game()
		test_label.init_object()
	

func _on_load_pressed():
	if world.save.save_exists():
		world.save = world.save.load_game()
		test_label.example_data = world.save.example_data
		test_label.load_object()


func _on_delete_pressed():
	world.save.delete_save()


func _on_change_example_pressed():
	var rng = RandomNumberGenerator.new()
	var my_random_number = rng.randf_range(-10.0, 10.0)
	world.save.example_data.example_string = "Number: %s" % my_random_number


func _on_start_test_dialogue_pressed():
	dialogue.start_dialogue("res://Scripts/Systems/dialogue_system/test_dialogue.json")



func _on_start_test_responses_pressed():
	responses.start_response("res://Scripts/Systems/response_system/test_response.json", "Test response")
	
