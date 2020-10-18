extends Node

func _ready():
	pass 


func kill():
	get_tree().get_root().get_node("Map/finalizacao/fade/AnimationPlayer").play("fade")

func block_moves_player():
	get_parent().get_node(".").ativar_moves(false)
