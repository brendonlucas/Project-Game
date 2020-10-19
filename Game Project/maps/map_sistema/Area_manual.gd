extends Area


func _ready():
	pass




func _on_Area_manual_body_entered(body):
	if body.name == "Player_hack":
		
		get_tree().paused = true
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		get_parent().get_node("manual").show()
		queue_free()
