extends StaticBody

func _ready():
	pass 


func open_gate():
	$AnimationPlayer.play("open")

func close_gate():
	$AnimationPlayer.play("close")
