extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$Sinal/No_sinal.show()
	pass

func set_active_sinal():
	$Sinal/on_sinal.show()
	$Sinal/No_sinal.hide()

func set_desative_sinal():
	$Sinal/No_sinal.show()
	$Sinal/on_sinal.show()
