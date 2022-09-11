extends KinematicBody


var gravity = Vector3(0, -9.81, 0)


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):

	# Getting input from controller
	var input_vector = Input.get_vector("move_left", "move_right", "move_forward", "move_back")

	# Translating view coordinates to player coordinates
	var angle = $ARVROrigin/View.get_transform().basis.get_euler().y
	var velocity = Vector3()
	velocity.x = input_vector.y * sin(angle) + input_vector.x * cos(angle)
	velocity.z = input_vector.y * cos(angle) - input_vector.x * sin(angle)
	
		# Handling collisions 
	var collision = move_and_collide(velocity*delta, true, true, true)
	if collision is KinematicCollision:
		velocity = velocity.slide(collision.get_normal())
		#if collision.get_normal().angle_to(-gravity) > PI/2 :
		#	velocity.y = 0

	move_and_slide(velocity, gravity, false, 1, 0.78, true)
