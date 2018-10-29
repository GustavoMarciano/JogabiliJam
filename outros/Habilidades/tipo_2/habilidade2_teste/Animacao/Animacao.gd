extends Node2D

func _process(delta):
	if $"..".dead:
		queue_free()

func _on_AnimationPlayer_animation_finished(anim_name):
	queue_free()