extends Node

var CURRENT_ROUND


# Called when the node enters the scene tree for the first time.
func _ready():
    CURRENT_ROUND = "player"
    pass # Replace with function body.


func switch_turn():
    if CURRENT_ROUND == "cube":
        CURRENT_ROUND = "player"
    elif CURRENT_ROUND == "player":
        CURRENT_ROUND = "cube"

func whos_turn():
    return CURRENT_ROUND
