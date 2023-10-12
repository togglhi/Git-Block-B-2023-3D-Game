extends CharacterBody3D

const MOVESPEED = 7
const ROLLSPEED = deg_to_rad(8)
const GRAVITY = 1.5
const JUMPSPEED = 15
const MOUSESENSITIVITY = 0.003
# Called when the node enters the scene tree for the first time.
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

#Gran the mouse movement

func _unhandled_input(event):
	if event is InputEventMouseMotion:
		rotation.y = rotation.y - event.relative.x * MOUSESENSITIVITY
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("quit"):
		get_tree().quit()
	#gravity
	velocity.y = velocity.y - GRAVITY
	
	#jumping
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMPSPEED
	
	
	#Movememnt
	if Input.is_action_pressed("left"):
		velocity.z = -MOVESPEED * global_transform.basis.x.z
		velocity.x = -MOVESPEED * global_transform.basis.x.x
		$MeshInstance3D.rotate_z(ROLLSPEED)
	elif Input.is_action_pressed("right"):
		velocity.z = MOVESPEED * global_transform.basis.x.z
		velocity.x = MOVESPEED * global_transform.basis.x.x
		$MeshInstance3D.rotate_z(-ROLLSPEED)
	elif Input.is_action_pressed("forward"):
		velocity.z = -MOVESPEED * global_transform.basis.z.z
		velocity.x = -MOVESPEED * global_transform.basis.z.x
		$MeshInstance3D.rotate_x(-ROLLSPEED)
	elif Input.is_action_pressed("backward"):
		velocity.z = MOVESPEED * global_transform.basis.z.z
		velocity.x = MOVESPEED * global_transform.basis.z.x
		$MeshInstance3D.rotate_x(ROLLSPEED)
	else:
		velocity.z = 0
		velocity.x = 0
	move_and_slide()
	


func _on_apple_body_entered(body):
	pass # Replace with function body.
