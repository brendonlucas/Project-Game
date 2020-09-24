extends Node
	
var dano_personagem = 135
var dano_arma = 48

func _process(delta):
	if Input.is_action_just_pressed("interact"):
		calculo_dano(50)



func calculo_dano(def):
	var def_inimigo = def
	
	var attack_total_personagem = dano_personagem + dano_arma
	var dano_gerado = attack_total_personagem - def_inimigo
	var dano_final = random_damage(dano_gerado)
	
	if critico_gen(dano_final) <= 30:
		dano_final = dano_critico(dano_final)
	return dano_final
	
func dano_critico(dano):
	var parte_dano = dano * 0.5
	return dano + parte_dano
	
func random_damage(dano_maximo):
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	var my_random_number = rng.randi_range((dano_maximo - 50), dano_maximo)
	return my_random_number

func critico_gen(dano):
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	var chance_critico = rng.randi_range(1, 100)
	return chance_critico
		
	
