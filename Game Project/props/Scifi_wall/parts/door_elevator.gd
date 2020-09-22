extends StaticBody

var aberta = false
var active = false
func _ready():
	#$"porta 1/Door_Right_Light2".get_surface_material(0).set_albedo(Color(255, 0, 0))
	get_parent().get_node("light_dor").get_surface_material(0).set_emission(Color( 0.86, 0.08, 0.24, 1 ))
	
	
func set_aberta(option):
	aberta = option

func set_active(option):
	active = option
	get_parent().get_node("light_dor").get_surface_material(0).set_emission(Color( 1, 1, 1))
	#$"porta 1/Door_Right_Light2".get_surface_material(0).set_emission(Color( 1, 0, 0))

func get_active():
	return active
