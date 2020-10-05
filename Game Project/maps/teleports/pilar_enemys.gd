extends Spatial

var pilares_destruidos = 0
var escudo_destruido = false
var nucleo_destruido = false
func _ready():
	pass

func _process(delta):
	if pilares_destruidos == 4 and !escudo_destruido:
		$cube_enemy/nucleo/escudo.queue_free()
		$cube_enemy/nucleo/MeshInstance/colision_nucleo.ativo = true
		escudo_destruido = true
	if pilares_destruidos == 5 and !nucleo_destruido:
		$cube_enemy/nucleo.queue_free()
		nucleo_destruido = true
