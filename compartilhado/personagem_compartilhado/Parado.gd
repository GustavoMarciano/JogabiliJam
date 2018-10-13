extends Node

func start():
	owner.mudar_animacao("Parado",1,0.2)
	owner.mudar_mobilidade_e_gravidade("desabilitar","normal")

func update(delta):
	if !owner.is_on_floor():
		exit("Caindo")

	if owner.direcao != 0:
		exit("Andando")

	if owner.habilidade0 != 0:
		 exit("Habilidade0")
	if owner.habilidade1 != 0:
		 exit("Habilidade1")
	if owner.habilidade2 != 0:
		 exit("Habilidade2")

func exit(state):
	owner.mudar_estado(state)