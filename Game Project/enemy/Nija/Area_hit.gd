extends Area

var entrou = false
var dano_arma
var dano_base

func _ready():
	pass 


func _on_Area_hit_body_entered(body):
	if body.name == "Player_v4" and !entrou:
		#print("entrou no player")
		dano_base = get_parent().get_parent().get_node(".").dano_base
		dano_arma = get_parent().get_parent().get_node(".").dano_arma
		body.hit_damage(PlayerStatus.calculo_dano(PlayerStatus.def_personagem, dano_base, dano_arma))
		entrou = true


func _on_Area_hit_body_exited(body):
	if body.name == "Player_v4" and entrou:
		#print("saiu do player")
		entrou = false
