extends Label

@export var example_data: ExampleData

func init_object():
	# We initialize the object here each case is different, for example an item
	# would have to be initialized with it's position and rotation

	# example_data.position =  self.position
	# example_data.rotation =  self.rotation
	self.text = example_data.example_string

func load_object():
	# if there is a save file we load the object in here

	# self.position = example_data.position
	# self.rotation = example_data.rotation
	self.text = example_data.example_string
