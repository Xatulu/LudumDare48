extends CSGMesh

signal FadeInComplete
signal FadeOutComplete

func fade_in():
    $AnimPlayer.play("FadeIn")
    
func fade_out():
    $AnimPlayer.play("FadeOut")


func _on_AnimPlayer_animation_finished(anim_name):
    emit_signal(anim_name + "Complete")
