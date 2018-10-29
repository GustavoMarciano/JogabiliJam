extends KinematicBody2D

var movimento = Vector2()
var direcao = 0
var estado_atual = ""

var atacando = false
var dead = false

onready var hurtbox = get_node("HurtBox")
onready var controle = get_node("Controle")
onready var sprite = $Sprite

func _ready():
	mudar_estado("Parado") 

func _physics_process(delta):
	estado_atual.update(delta)
	movimento = move_and_slide(movimento,Vector2(0,-1))

func mudar_animacao(anim_name,anim_speed,anim_blend):
	$Sprite.mudar_animacao(anim_name,anim_speed,anim_blend)

func mudar_escala_sprite(val1,val2):
	if direcao != 0:
		sprite.set_scale(Vector2(val1,val2))
		

func mudar_mobilidade_e_gravidade(mobilidade,gravidade):
	$Mobilidade.modificar_mobilidade(mobilidade)
	$Gravidade.modificar_gravidade(gravidade)

func tomar_dano(valor):
	$HP.dano(valor)

func mudar_estado(estado):
	var path = "Estados/" + estado
	if get_node(path):
		estado_atual = get_node(path)
		estado_atual.start()

func esta():
	if dead:
		return "Morto"
	if !is_on_floor():
		return "Caindo"
	elif direcao == 0:
		return "Parado"
	else:
		return "Andando"