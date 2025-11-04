extends CharacterBody3D

## How fast the player moves in m/s
@export var speed = 10.0
## Downward acceleration when in the air, in m/s^2
@export var fall_acceleration = 75.0

var input_direction # The current movement input
var target_velocity # The player's target movement vector


func _ready() -> void:
	input_direction = Vector3.ZERO
	target_velocity = Vector3.ZERO


func _process(delta: float) -> void:
	# Local temporary variable for the input direction
	# Its x value will be used as the x value for input_direction
	# Its y value will be used as the z value for input_direction
	var temp_input_direction = Input.get_vector("move_left", "move_right", "move_forward", "move_back").normalized()
	input_direction.x = temp_input_direction.x
	input_direction.z = temp_input_direction.y


func _physics_process(delta: float) -> void:
	if input_direction != Vector3.ZERO:
		# Rotates the player towards the direction moved
		$Pivot.basis = Basis.looking_at(input_direction)
	
	# Ground Velocity
	target_velocity.x = input_direction.x * speed
	target_velocity.z = input_direction.z * speed

	# Vertical Velocity
	if not is_on_floor(): # If in the air, fall towards the floor. Literally gravity
		target_velocity.y = target_velocity.y - (fall_acceleration * delta)

	# Moving the Character
	velocity = target_velocity
	move_and_slide()
