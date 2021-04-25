extends Node

var attack_lower = 1
var attack_upper = 3
var xp = 0
var xp_prior = 0
var gold = 0
var gold_prior = 0
var player_level = 1
var room_difficulty = 1
var floor_level = 1
var health = 10
var max_health = 10
var player_leveled_up = false
var armor = 0
var damage_upgrades_bought = 0


func get_player_damage() -> int:
    var lower_bound = attack_lower
    var upper_bound = attack_upper
    return int(floor(rand_range(lower_bound, upper_bound)))+1

func level_up_player() -> void:
    var req_xp = get_required_xp_to_level()
    if xp >= req_xp:
        player_level += 1  
        max_health += 5
        health = max_health
        player_leveled_up = true    
        

func get_required_xp_to_level() -> int:
    return (player_level-1) * 8 + 10 * player_level
func get_gold_delta() -> int:
    var earned_gold = gold - gold_prior
    gold_prior = gold
    return earned_gold
    
func get_xp_delta() -> int:
    var earned_xp = xp - xp_prior
    xp_prior = xp
    return earned_xp
    
func go_deeper() -> void:
    floor_level += 1
    increase_room_difficulty()
    
func increase_room_difficulty() -> void:
    room_difficulty += clamp(floor_level/2,1,floor_level)

func check_for_death() -> void:
    if health <= 0:
        Global.goto_scene("res://GameOver.tscn")

func reset() -> void:
    attack_lower = 1
    attack_upper = 3
    xp = 0
    xp_prior = 0
    gold = 0
    gold_prior = 0
    player_level = 1
    room_difficulty = 1
    floor_level = 1
    health = 10
    max_health = 10
    player_leveled_up = false
    armor = 0
    damage_upgrades_bought = 0
