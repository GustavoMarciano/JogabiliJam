extends Sprite

onready var anim_player = self #get_node("Animation/AnimationPlayer")
var anim = ""
var anim_new = ""
var anim_speed = 0
var anim_blend = 0
var sprite_scale = Vector2()

func mudar_animacao(anim_name,anim_speed,anim_blend):
	pass
#	anim = anim_name
#	anim_speed = anim_speed
#	anim_blend = anim_blend
#	if anim != anim_new:
#		anim_new = anim
#		anim_player.play(anim,anim_blend,anim_speed)