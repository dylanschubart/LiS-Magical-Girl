# This Script should control the world and keep track of the saving, it will also be on the main scene

class_name World
extends Node

var save: SaveData = SaveData.new()

func load_game():
    if save.save_exists():
        save.load_game()
        # Load into/change scene
    else:
        # Set game up with a new save file
        pass