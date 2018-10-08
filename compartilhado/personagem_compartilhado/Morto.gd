extends Node

func start():
	owner.mudar_animacao("Idle",1,0.2)

func update(delta):
	if !owner.is_on_floor():
		exit("Fall")

	if owner.move_dir != 0:
		exit("Move")

func exit(state):
	owner.mudar_estado(state)