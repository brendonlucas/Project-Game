extends MeshInstance

func _ready():
	pass

func _on_Area_bloqueio_body_entered(body):
	if body.name == "Player_v4":
		show()
		$colisao/CollisionShape.disabled = false
		$AnimationPlayer.play("move")
		$Area_bloqueio/CollisionShape.disabled = true
	
func reset():
	hide()
	$colisao/CollisionShape.disabled = true
	$AnimationPlayer.stop()
	$Area_bloqueio/CollisionShape.disabled = false

func _process(delta):
	if Input.is_action_just_pressed("jump"):
		reset()
