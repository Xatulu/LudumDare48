extends Spatial

onready var BASIC_ROOM : PackedScene = load("res://Room_Normal.tscn")

var list_of_rooms : Array
var room_layout : PackedScene
var rng = RandomNumberGenerator.new()

signal set_amount_of_enemies


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
    rng.randomize()
    initialize_room_list()
    decide_room_layout()
    decide_amount_enemies()
    
func initialize_room_list() -> void:
    list_of_rooms = [BASIC_ROOM]
    
func decide_room_layout() -> void:
    room_layout = list_of_rooms[0]
    add_child(room_layout.instance())
    
func decide_amount_enemies() -> void:
    var amount_of_enemies = + rng.randi_range(PlayerVariables.floor_level, PlayerVariables.room_difficulty)
    emit_signal("set_amount_of_enemies", amount_of_enemies)
