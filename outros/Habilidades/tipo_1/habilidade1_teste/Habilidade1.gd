extends Node

signal cd_animation(tempo)

export(float,0.5,8) var cd_time = 1
var poder
var em_cd = false
var obj = load("res://outros/Habilidades/tipo_1/habilidade1_teste/Animacao/Animacao.tscn")


func start():
	owner.mudar_animacao("Ataque",1,0.2)
	owner.mudar_mobilidade_e_gravidade("","")
	owner.controle.set_process(false)
	poder = Utils.create_object(obj,owner)
	poder.set_scale(owner.sprite.get_scale())
	owner.sprite.hide()
	poder.get_node("AnimationPlayer").playback_speed = 1
	

	owner.hurtbox.disable = true
	owner.row_crit()
	em_cd = true
	owner.atacando = true
	owner.movimento.x = 1000 * owner.sprite.scale.x


	cd_time = cd_time - owner.reducao_cd_base
	cd_time = max(0.5,cd_time) 
	
	$"CanvasLayer/Tween".interpolate_property($"CanvasLayer/TextureProgress","value",0,100,cd_time,Tween.TRANS_CIRC,Tween.EASE_OUT)
	$"CanvasLayer/Tween".interpolate_property($"CanvasLayer/TextureProgress", "modulate", 
      Color(1, 1, 1, .5), Color(1, 1, 1, 1), cd_time, 
      Tween.TRANS_LINEAR, Tween.EASE_IN)
	$"CanvasLayer/Tween".start()
	$Timer.wait_time = cd_time
	$Timer.start()

func update(delta):
	if !is_instance_valid(poder):
		owner.hurtbox.disable = false
		owner.controle.set_process(true)
		owner.atacando = false
		owner.sprite.show()
		owner.mudar_estado(owner.esta())

func _on_Timer_timeout():
	em_cd = false