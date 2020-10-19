extends Control

func _ready():
	$Sinal/on_sinal.show()
	update_values()
	update_energy_bar()
	
	
func update_values():
	$Status/HP_bar.max_value =  PlayerStatus.vida_maxima
	$Status/HP_bar.value =  PlayerStatus.vida_atual
	
func update_energy_bar():
	$Status/energy_bar.max_value = 1200
	$Status/energy_bar.value = PlayerStatus.energy
