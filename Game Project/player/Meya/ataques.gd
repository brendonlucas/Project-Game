extends Node

var player

func _ready():
	player = get_parent().get_node(".")

func _process(delta):
		pass

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name in ["attack1", "attack2", "attack3","attack_charge_1"]:
		player.active_moves_ataque(false)
	elif anim_name == "attack1":
		player.change_ataque(2)
	elif anim_name == "attack2":
		player.change_ataque(3)
	elif anim_name == "attack3":
		player.change_ataque(0)
