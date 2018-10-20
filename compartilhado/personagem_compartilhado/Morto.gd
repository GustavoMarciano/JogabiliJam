extends Node

func start():
	owner.mudar_animacao("Morto",1,.2)
	owner.mudar_mobilidade_e_gravidade("desabilitar","normal")
	owner.controle.set_process(false)
	owner.last_hit.add_xp(owner.nivel * 50)

func update(delta):
	owner.sprite.modulate.a -= 0.01
	if owner.sprite.modulate.a < 0.001:
		owner.queue_free()