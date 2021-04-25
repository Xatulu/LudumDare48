extends Camera

signal FadeOutComplete

# Called when the node enters the scene tree for the first time.
func _ready():
    fade_in()

func fade_in():
    $FadeIn.fade_in()
    
func fade_out():
    $FadeIn.fade_out()


func _on_FadeIn_FadeOutComplete():
    emit_signal("FadeOutComplete")
