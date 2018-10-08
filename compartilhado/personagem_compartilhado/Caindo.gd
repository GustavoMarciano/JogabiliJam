extends Node

func start():
	owner.mudar_animacao("Caindo",1,0.2)
	owner.mudar_mobilidade_e_gravidade("ar","normal")

func update(delta):
	if owner.is_on_floor() && owner.direcao == 0:
		exit("Parado")

	if owner.is_on_floor() && owner.direcao != 0:
		exit("Andando")

func exit(state):
	owner.mudar_estado(state)