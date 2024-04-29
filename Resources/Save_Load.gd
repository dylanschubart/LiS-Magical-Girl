class_name SaveData
extends Resource
#E 0:00:03:0129   save_data.gd:14 @ save_game(): Resource was not pre cached for the resource section, bug?
# bug with .tres file, fix with .res
const FILE_PATH = "user://savegame.tres"

#Data to Save
@export var areas: Dictionary
@export var example_data: ExampleData

# @export var characters: Dictionary
# @export var inventory: InventoryData
# @export var equipment: EquipmentData


# Saves the game and either creates a new file or fills the file with the same filepath with the new ressources
func save_game():
	ResourceSaver.save(self, FILE_PATH)


# Check if the save file exists (Returns true or false)
func save_exists():
	return ResourceLoader.exists(FILE_PATH)


func load_game():
	#Start getting the saved data from the savefile
	#if not ResourceLoader.has_cached(FILE_PATH):
	return ResourceLoader.load(FILE_PATH, "", ResourceLoader.CACHE_MODE_IGNORE)

# Delete the current SaveFile
func delete_save():
	if FileAccess.file_exists(FILE_PATH):
		var dir = DirAccess.open("user://")
		dir.remove(FILE_PATH)
		
