extends Area3D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	rotate_y(0.1)


func _on_body_entered(body):
	$coinsound.play()
	$scene.queue_free()

func _on_coinsound_finished():
	queue_free()
