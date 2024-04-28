extends CharacterBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 4.5

# Set variable pivot to CamOrigin (@onready = loads var with scene)
@onready var pivot = $CamOrigin

# @export show var in inspector (GoDot) and can be edited there
@export var sens = 0.5
@export var x_clamp_neg = -90
@export var x_clamp_pos = 15

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

# For Capturing Mouse in Screen
func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED	

func _input(event):
	if event is InputEventMouseMotion:
		# Rotate Player
		rotate_y(deg_to_rad(-event.relative.x * sens))
		# rotate up, down
		pivot.rotate_x(deg_to_rad(-event.relative.y * sens))
		# Limit up, down rotaton
		pivot.rotation.x = clamp(pivot.rotation.x, deg_to_rad(x_clamp_neg), deg_to_rad(x_clamp_pos))



func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Exit game when Press ESC (or binded button to "quit")
	if Input.is_action_just_pressed("Quit"):
		get_tree().quit()

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector("Left", "Right", "Forward", "Backward")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()
