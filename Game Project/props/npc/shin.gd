extends Spatial

func _ready():
	pass


func _on_Area_body_entered(body):
	if body.name == "Player_v4":
		$fade_animation.play("fade")
