extends Node

var poder

func start():
	owner.mudar_animacao("Ataque",1,0)
	owner.mudar_mobilidade_e_gravidade("desabilitar","normal")
	poder = Utils.create_object(load("res://outros/Habilidades/tipo_0/habilidade_test/Animacao/Animacao.tscn"),owner)
	poder.set_scale(owner.sprite.get_scale())

func update(delta):
	if !is_instance_valid(poder):
		exit("Ultimo")

func exit(state):
	owner.mudar_estado(state)