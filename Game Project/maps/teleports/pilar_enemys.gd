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

func reset():
	$cube_enemy/nucleo/MeshInstance/colision_nucleo.vida = 10000
	$pilar.vida = 2000
	$pilar.desativado = false
	$pilar.ativo = true
	
	$pilar2.vida = 2000
	$pilar2.desativado = false
	$pilar2.ativo = true
	
	$pilar3.vida = 2000
	$pilar3.desativado = false
	$pilar3.ativo = true
	
	$pilar4.vida = 2000
	$pilar4.desativado = false
	$pilar4.ativo = true
