extends Area

var atual = "grama"
func _ready():
	pass


func _on_Area_passo_types_body_entered(body):
	print(body.name)
	if body.is_in_group("metal"):
		print("metal")
		atual = "metal"
	
	else:
		print("chao normal")
		atual = "grama"


func _on_Area_passo_types_body_exited(body):
	if body.is_in_group("metal"):
		print("ss")
