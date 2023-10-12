extends CanvasLayer

var coins = 0
@export var timeleft = 60

# Called when the node enters the scene tree for the first time.
func _ready():
	$coindisplay.text = "coins: " + str(coins)
	$timedisplay.text = "time: " + str(timeleft)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_apple_body_entered(body):
	coins = coins + 1
	$coindisplay.text = "coins: " + str(coins)


func _on_timer_timeout():
	timeleft -=1
	$timedisplay.text = "time: " + str(timeleft)
	if timeleft == 0:
		get_tree().reload_current_scene()
