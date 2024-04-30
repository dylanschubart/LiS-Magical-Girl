extends MeshInstance3D


func _on_interaction_area_focused(_interactor):
	print_debug("focuses")


func _on_interaction_area_interacted(_interactor):
	print_debug("interacted")
	dialogue.start_dialogue("res://Scripts/Systems/dialogue_system/test_dialogue.json")


func _on_interaction_area_unfocused(_interactor):
	print_debug("unfocused")
