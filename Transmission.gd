extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
    var Text1 = "[center]You earned " + str(PlayerVariables.get_xp_delta()) + " XP and " + str(PlayerVariables.get_gold_delta()) + " Gold for clearing floor " + str(PlayerVariables.floor_level) + ".\n"
    var Text2 = "[/center]"
    var xp_needed = str(PlayerVariables.get_required_xp_to_level() - PlayerVariables.xp)
    var Text_XP = "You need " + xp_needed + " more XP to level up.\n"
    if PlayerVariables.player_leveled_up:
        PlayerVariables.player_leveled_up = false
        Text_XP = "You leveled up during this floor and reached Level " + str(PlayerVariables.player_level) + ".\n"
    
    $RichTextLabel2.bbcode_text = Text1 + Text_XP + Text2
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#    pass


func _on_Button_pressed():
    PlayerVariables.go_deeper()
    Global.goto_scene("res://Level_Handler.tscn")


func _on_Button2_pressed():
    Global.goto_scene("res://Shopping.tscn")
