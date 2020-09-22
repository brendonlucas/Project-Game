extends StaticBody

func _ready():
	#$AnimationPlayer.play("open") 
	pass
var aberta = false

func _process(delta):
	if Gamestate.gerador_1 and Gamestate.gerador_2 and !aberta:
		open_the_door()
		aberta = true
func open_the_door():
	$AnimationPlayer.play("open")

func close_the_door():
	$AnimationPlayer.play("close")
