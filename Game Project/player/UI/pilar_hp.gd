extends Control

func _ready():
	pass

func set_values():
	var pilar_1 = get_tree().get_root().get_node("Map/pilar_enemys/pilar")
	var pilar_2 = get_tree().get_root().get_node("Map/pilar_enemys/pilar2")
	var pilar_3 = get_tree().get_root().get_node("Map/pilar_enemys/pilar3")
	var pilar_4 = get_tree().get_root().get_node("Map/pilar_enemys/pilar4")
	
	$bar_pilar.max_value = pilar_1.vida_maxima
	$bar_pilar.value = pilar_1.vida
	$bar_pilar2.max_value = pilar_2.vida_maxima
	$bar_pilar2.value = pilar_2.vida
	$bar_pilar3.max_value = pilar_3.vida_maxima
	$bar_pilar3.value = pilar_3.vida
	$bar_pilar4.max_value = pilar_4.vida_maxima
	$bar_pilar4.value = pilar_4.vida
