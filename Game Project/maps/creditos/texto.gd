extends Control

func _ready():
	pass


func set_values(values):
	$Referente.set_text(values['referente'])
	$names.set_text(values['nome'])
