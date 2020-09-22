extends StaticBody

func _ready():
	#$AnimationPlayer.play("open") 
	pass

func open_the_door():
	$AnimationPlayer.play("open")

func close_the_door():
	$AnimationPlayer.play("close")
