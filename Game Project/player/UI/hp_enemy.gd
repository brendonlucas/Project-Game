extends Control

func _ready():
	pass
		
func set_name(name):
	$bar_vida/enemy_name.set_text(name)
	
func set_values(hp_atual, hp_total):
	$bar_vida.max_value = hp_total
	$bar_vida.value = hp_atual
