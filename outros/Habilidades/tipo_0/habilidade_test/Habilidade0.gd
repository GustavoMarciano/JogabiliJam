extends Node

export(float,0.5,2) var cd_time = 1
var poder
var em_cd = false
var obj = load("res://outros/Habilidades/tipo_0/habilidade_test/Animacao/Animacao.tscn")

func start():
	em_cd = true
	owner.mudar_animacao("Ataque",1,0)
	owner.mudar_mobilidade_e_gravidade("desabilitar","normal")
	poder = Utils.create_object(obj,owner)
	poder.set_scale(owner.sprite.get_scale())
	cd_time = cd_time - owner.reducao_cd
	cd_time = max(1,cd_time) 
	$Timer.wait_time = cd_time
	$Timer.start()

func update(delta):
	if !is_instance_valid(poder):
		exit("Ultimo")

func exit(state):
	owner.mudar_estado(state)

func _on_Timer_timeout():
	em_cd = false