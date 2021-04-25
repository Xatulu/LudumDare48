extends Spatial

func _ready():
    $HealthBar3D.update(PlayerVariables.health, PlayerVariables.max_health)

func _process(delta):
    $HealthBar3D.update(PlayerVariables.health, PlayerVariables.max_health)


func _on_EnemySpawner_room_clear():
    fade_to_black()
    
func fade_to_black():
    $Camera.fade_out()

func _on_Camera_FadeOutComplete():
    Global.goto_scene("res://Transmission.tscn")
