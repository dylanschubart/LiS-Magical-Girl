# This Script should control the world and keep track of the saving, it will also be on the main scene

class_name world_data
extends Node

var save: SaveData = SaveData.new()

var areas: Dictionary = {
	"test_area": "res://Scenes/main_whatever_test.tscn"
}

func load_game():
	if save.save_exists():
		save = save.load_game()
		# Load into/change scene
		# will be replaced with a function in the world manager
		change_scene("test_area")
	else:
		# Set game up with a new save file
		save.save_game()
		change_scene("test_area")


func change_scene(area_name: String):
	var load_level = load(areas[area_name])
	var instantiated_level = load_level.instantiate()
	get_tree().root.add_child(instantiated_level)


