extends Spatial

var active = false

func _ready():
	pass

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "active_down":
		$door_elevator/painel2.set_open(true)
		$door_elevator/AnimationPlayer.play("open")

func set_active(option):
	active = option
