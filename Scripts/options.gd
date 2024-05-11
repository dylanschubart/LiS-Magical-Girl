extends Control

var ui
enum MENUS{main_menu, pause_menu}

var current_menu: MENUS

# Called when the node enters the scene tree for the first time.
func _ready():
	ui = get_parent()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_exit_pressed():
	ui.toggle_element(ui.options)
	
	match current_menu:
		0:
			ui.toggle_element(ui.main_menu)
		1:
			ui.toggle_element(ui.pause_menu)		
	


	

