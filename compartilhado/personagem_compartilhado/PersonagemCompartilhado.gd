extends KinematicBody2D

var movimento = Vector2()
var direcao = 0
var estado_atual
var snap = Vector2(0,32)

func _ready():
	mudar_estado("Parado")

func _physics_process(delta):
	movimento = move_and_slide(movimento,Vector2(0,-1))

	if estado_atual != null:
		estado_atual.update(delta)

func mudar_estado(estado):
	estado_atual = $Estados.mudar_estado(estado)

func mudar_animacao(anim_name,anim_speed,anim_blend):
	$Sprite.mudar_animacao(anim_name,anim_speed,anim_blend)

func mudar_escala_sprite(val1,val2):
	if direcao != 0:
		$Sprite.set_scale(Vector2(val1,val2))

func mudar_mobilidade_e_gravidade(mobilidade,gravidade):
	$Mobilidade.modificar_mobilidade(mobilidade)
	$Gravidade.modificar_gravidade(gravidade)