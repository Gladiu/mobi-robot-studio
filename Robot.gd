extends Spatial


var selected_joint : int = 1


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# Getting input from controller
	var input_vector_one = Input.get_axis("stick_left", "stick_right")
	
	$base/one.rotate_y(input_vector_one*delta*2)

	var input_vector_two = Input.get_axis("stick_down", "stick_up")
	
	$base/one/two.rotate_z(input_vector_two*delta*2)
