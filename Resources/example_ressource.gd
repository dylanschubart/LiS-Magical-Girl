extends Resource
class_name ExampleData

@export var example_int: int = 5
@export var example_string: String = "5"
@export var example_bool: bool = false
@export var example_array: Array[ExampleData] # either you specify another ressource in an Array or an empty array: Array[]

enum EXAMPLE_ENUM {value_1, value_2}
@export var enum_select: EXAMPLE_ENUM

func print_values():
    print_debug(example_int)
    print_debug(example_string)
    print_debug(example_bool)
    print_debug(example_array)
    print_debug(enum_select)