extends Node

signal cd_animation(tempo)

export(float,0.5,8) var cd_time = 1
var poder
var em_cd = false
var obj = load("res://outros/Habilidades/tipo_0/habilidade_test/Animacao/Animacao.tscn")


func start():
	owner.mudar_animacao("Ataque",1,0.2)
	owner.mudar_mobilidade_e_gravidade("desabilitar","normal")
	owner.controle.set_process(false)

	poder = Utils.create_object(obj,owner)
	poder.set_scale(owner.sprite.get_scale())
	poder.get_node("AnimationPlayer").playback_speed = 1

	owner.row_crit()
	em_cd = true
	owner.atacando = true

	var status = {
		"Owner":owner,
		"Side":owner.side,
		"Dano": round(rand_range(owner.dmg_range[0],owner.dmg_range[1])) + 12,
		"Critico": owner.critico 
		}

	status["Knock"] = {"timer":.3,"x":50 * poder.get_scale().x,"y":0}

	poder.get_node("Position2D/HitBox").lista(status)

	cd_time = cd_time - owner.reducao_cd_base
	cd_time = max(0.5,cd_time) 
	$"CanvasLayer/Tween".interpolate_property($"CanvasLayer/TextureProgress","value",0,100,cd_time,Tween.TRANS_CIRC,Tween.EASE_OUT)
	$"CanvasLayer/Tween".interpolate_property($"CanvasLayer/TextureProgress", "modulate", 
      Color(1, 1, 1, .5), Color(1, 1, 1, 1), cd_time, 
      Tween.TRANS_QUINT, Tween.EASE_OUT)
	$"CanvasLayer/Tween".start()
	$Timer.wait_time = cd_time
	$Timer.start()

func update(delta):
	if !is_instance_valid(poder):
		owner.controle.set_process(true)
		owner.atacando = false
		owner.mudar_estado(owner.esta())

func _on_Timer_timeout():
	em_cd = false