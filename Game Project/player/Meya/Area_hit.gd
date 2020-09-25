extends Area

var entrou = false

func _ready():
	pass 


func _on_Area_hit_body_entered(body):
	if body.name == "nija" and !entrou:
		print("entrou")
		print("coida" , body.defesa)
		print(PlayerStatus.calculo_dano(body.defesa, PlayerStatus.dano_personagem, PlayerStatus.dano_arma))
		entrou = true


func _on_Area_hit_body_exited(body):
	if body.name == "nija" and entrou:
		print("saiu")
		entrou = false
