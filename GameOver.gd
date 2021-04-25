extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
    PlayerVariables.reset()
    $GameOverInfo.bbcode_text = "[center]The cubes have bested you.\nThe last floor you cleared was Floor " + str(PlayerVariables.floor_level) + ".\n\n Try again?[/center]"

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#    pass

func _on_Button_pressed():
    Global.goto_scene("res://MainMenu.tscn")
