extends CanvasLayer

var extentions = 0
@export var timeleft = 60

# Called when the node enters the scene tree for the first time.
func _ready():
	$bonusdisplay.text = "bonus: " + str(extentions)
	$timedisplay.text = "time: " + str(timeleft)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_hourglass_body_entered(body):
	extentions = extentions + 1
	timeleft +=5
	$bonusdisplay.text = "bonus: " + str(extentions)


func _on_timer_timeout():
	timeleft -=1
	$timedisplay.text = "time: " + str(timeleft)
	if timeleft == 0:
		get_tree().change_scene_to_file("res://deadscreen.tscn")
