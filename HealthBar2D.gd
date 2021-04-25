extends TextureProgress

var bar_red = preload("res://assets/barHorizontal_red.png")
var bar_green = preload("res://assets/barHorizontal_green.png")
var bar_yellow = preload("res://assets/barHorizontal_yellow.png")

func _ready():
    hide()

func update_bar(amount, full):
    max_value = full
    texture_progress = bar_green
    if amount < 0.75 * full:
        texture_progress = bar_yellow
    if value < 0.45 * full:
        texture_progress = bar_red
    show()
    value = amount
