extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
    updateText()
func _on_Button_pressed():
    PlayerVariables.go_deeper()
    Global.goto_scene("res://Level_Handler.tscn")


func _on_UpgradeAttack_pressed():
    if PlayerVariables.gold >=5+(PlayerVariables.damage_upgrades_bought)*3:
        PlayerVariables.attack_lower += 1
        PlayerVariables.attack_upper += 1
        PlayerVariables.gold -= 5 + (PlayerVariables.damage_upgrades_bought)*3
        PlayerVariables.damage_upgrades_bought += 1
    updateText()
    
func updateText():
    $Attack_Info.bbcode_text = "[center]Current avg. Attack: " + str(round((PlayerVariables.attack_upper + PlayerVariables.attack_lower)/2)) +"\nUpgrade Cost: " + str(5+(PlayerVariables.damage_upgrades_bought)*3) + " Gold"
    $Gold_Info.bbcode_text = "[center]You have " + str(PlayerVariables.gold) + " Gold available."
    $Armor_Info.bbcode_text = "[center]Current Armor: " + str(PlayerVariables.armor) + "\nCost of next Point: " + str(3*(PlayerVariables.armor+1))
    $Health_Info.bbcode_text = "[center]Current Health: " + str(PlayerVariables.health) + "\nMax Health: " + str(PlayerVariables.max_health) + "\n Cost per 1HP: 1 Gold"

func _on_UpgradeArmor_pressed():
    var upgrade_cost = 3*(PlayerVariables.armor+1)
    if PlayerVariables.gold >= upgrade_cost:
        PlayerVariables.armor += 1
        PlayerVariables.gold -= upgrade_cost
    updateText()

func _on_Heal_pressed():
    if PlayerVariables.gold >= 1 && PlayerVariables.health < PlayerVariables.max_health:
        PlayerVariables.health+=1
        PlayerVariables.gold-=1
    updateText()
