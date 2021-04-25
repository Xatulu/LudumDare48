extends Node

onready var ENEMY : PackedScene = load("res://EnemyPlaceholder.tscn")

var enemies_in_current_room = 1
var enemies_defeated = 0 
var rng = RandomNumberGenerator.new()

signal room_clear

func _ready():
    rng.randomize()
    pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#    pass

func _on_EnemyPlaceholder_enemy_died():
    $Respawn_Timer.start(3)
    enemies_defeated += 1
    var drops : Array = calculate_drops()
    award_player(drops)
    if enemies_defeated >= enemies_in_current_room:
        emit_signal("room_clear")

func _on_Respawn_Timer_timeout():
    if enemies_defeated < enemies_in_current_room:
        add_child(ENEMY.instance())

func calculate_drops() -> Array:
    var gold_reward = rng.randi_range(0, PlayerVariables.room_difficulty/1.5)*PlayerVariables.floor_level/PlayerVariables.player_level + 1
    var xp_reward = rng.randi_range(0, PlayerVariables.room_difficulty/1.5)*PlayerVariables.floor_level/PlayerVariables.player_level + 1
    return [gold_reward, xp_reward]

func award_player(reward):
    PlayerVariables.gold += reward[0]
    PlayerVariables.xp += reward[1]
    PlayerVariables.level_up_player()


func _set_amount_of_enemies(enemy_amount):
    enemies_in_current_room = enemy_amount
    enemies_defeated = 0
