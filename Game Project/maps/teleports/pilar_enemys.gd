extends Spatial

var pilares_destruidos = 0
var escudo_destruido = false
var nucleo_destruido = false

func _ready():
	pass
	
func _process(delta):
	if pilares_destruidos == 4 and !escudo_destruido:
		drop_escudo()
	if pilares_destruidos == 5 and !nucleo_destruido:
		$cube_enemy.queue_free()
		nucleo_destruido = true

func reset():
	pilares_destruidos = 0
	escudo_destruido = false
	nucleo_destruido = false
	$cube_enemy/nucleo/MeshInstance/colision_nucleo.reset()
	$cube_enemy/nucleo/escudo.reset()
	$pilar.reset()
	$pilar2.reset()
	$pilar3.reset()
	$pilar4.reset()
	
func drop_escudo():
	$cube_enemy/nucleo/escudo.hide()
	$cube_enemy/nucleo/escudo/StaticBody/CollisionShape.disabled = true
	$cube_enemy/nucleo/MeshInstance/colision_nucleo.ativo = true
	escudo_destruido = true
