extends Node

signal game_end(nivel,kills)

func start():
	owner.mudar_animacao("Morto",1,.2)
	owner.mudar_mobilidade_e_gravidade("desabilitar","normal")
	owner.controle.set_process(false)
	if owner.last_hit != null:
		owner.last_hit.add_xp(owner.nivel * 15)
		owner.last_hit.kills += 1
	Game.inimigos -= 1

func update(delta):
	owner.sprite.modulate.a -= 0.01
	if owner.sprite.modulate.a < 0.001:
		emit_signal("game_end",owner.nivel,owner.kills)
		owner.queue_free()