extends Control

func _ready():
	update_values()
	
	
func update_values():
	$Status/HP_bar.max_value =  PlayerStatus.vida_maxima
	$Status/HP_bar.value =  PlayerStatus.vida_atual
	
