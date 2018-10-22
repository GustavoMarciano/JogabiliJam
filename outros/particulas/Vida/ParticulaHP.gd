extends Node2D

func start(value):
	$"Position2D/Label".text = str(value)

func _on_AnimationPlayer_animation_finished(anim_name):
	queue_free()