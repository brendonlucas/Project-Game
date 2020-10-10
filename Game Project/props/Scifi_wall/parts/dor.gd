extends StaticBody


func _ready():
	pass # Replace with function body.


func _on_Area_open_body_entered(body):
	pass
	if body.name == "Player_v4":
		$AnimationPlayer.play("open")
		$door_s.play()


func _on_Area_open_body_exited(body):
	pass
	if body.name == "Player_v4":
		$AnimationPlayer.play("close")
		$door_s.play()
