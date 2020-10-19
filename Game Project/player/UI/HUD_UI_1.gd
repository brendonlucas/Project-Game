extends Control

func _ready():
	$Sinal/No_sinal.show()
	update_values()
	update_energy_bar()
	
	
func update_values():
	$Status/HP_bar.max_value =  PlayerStatus.vida_maxima
	$Status/HP_bar.value =  PlayerStatus.vida_atual
	
func set_active_sinal():
	$Sinal/on_sinal.show()
	$Sinal/No_sinal.hide()

func set_desative_sinal():
	$Sinal/No_sinal.show()
	$Sinal/on_sinal.show()

func update_energy_bar():
	$Status/energy_bar.max_value = 1200
	$Status/energy_bar.value = PlayerStatus.energy
