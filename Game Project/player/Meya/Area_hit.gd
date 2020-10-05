extends Area

var entrou = false

func _ready():
	pass 

func _on_Area_hit_body_entered(body):
	if body.is_in_group("enemy") and !entrou:
		var dano = PlayerStatus.calculo_dano(body.defesa, PlayerStatus.dano_personagem, PlayerStatus.dano_arma)
		body.hit_damage(dano)
		entrou = true

func _on_Area_hit_body_exited(body):
	if body.is_in_group("enemy") and entrou:
		entrou = false
