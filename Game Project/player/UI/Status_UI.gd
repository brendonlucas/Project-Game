extends Control

func _ready():
	update_values()
	
func update_values():
	$Status_container/box_dados/PV_container/Label_pv_values.set_text(str(PlayerStatus.vida_atual) + " / " + str(PlayerStatus.vida_maxima))
	$Status_container/box_dados/Def_container/Label_def_values.set_text(str(PlayerStatus.def_personagem))
	$Status_container/box_dados/attack_container/Label_attack_values.set_text(str(PlayerStatus.dano_personagem) + " + " + str(PlayerStatus.dano_arma))
	$Status_container/box_dados/Nivel_container/Label_Nivel_values.set_text(str(PlayerStatus.nivel))
	$Status_container/box_dados/Exp_atual_container/Label_exp_values.set_text(str(PlayerStatus.exp_atual) + " / " + str(PlayerStatus.exp_niveis[str(PlayerStatus.nivel)]))

var mostrando = false
func _process(delta):
	if Input.is_action_just_pressed("info"):
		if mostrando:
			hide()
			mostrando = false
		elif !mostrando:
			show()
			mostrando = true
	
