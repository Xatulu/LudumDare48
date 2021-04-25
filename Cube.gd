extends StaticBody

var hp : int
var max_health : int
var drops : Array
var damageable : bool = false
var rng = RandomNumberGenerator.new()

onready var health_bar = $HealthBar3D

signal enemy_died

func _ready():
    rng.randomize()
    set_up_cube()
    fade_in()
    animate_cube()
    CombatHandler.CURRENT_ROUND = "player"

func fade_in():
    $Flash.play("SpawnCube")

func set_up_cube():
    max_health = rng.randi_range(0, (PlayerVariables.floor_level + PlayerVariables.room_difficulty))+5
    hp = max_health
    $HealthBar3D.update(hp, max_health)
    $Cube.mesh.size = Vector3(0, 0, 0)
    $Cube.rotation = Vector3(rng.randi_range(0,90),rng.randi_range(0,90),rng.randi_range(0,90))
    var _error_code = connect("enemy_died", get_parent(), "_on_EnemyPlaceholder_enemy_died")


func animate_cube():
    var tween = $Tween
    tween.interpolate_property($Cube, "rotation", $Cube.rotation, $Cube.rotation + Vector3(1, 1, 1), 5, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
    tween.start()

func _on_Cube_input_event(_camera, event, _click_position, _click_normal, _shape_idx):
    if event.is_pressed() && damageable && CombatHandler.whos_turn()=="player":
        damage()
        CombatHandler.switch_turn()
        
func damage() -> void:
    $PlayerAttack.play()
    damageable = false
    hp -= PlayerVariables.get_player_damage()
    $HealthBar3D.update(hp, max_health)
    flash_colour()

func flash_colour():
    $Flash.play("DamageFlash")
    
func check_death():
    if hp <= 0:
        queue_free()
        emit_signal("enemy_died")


func _on_AnimPlayer_animation_finished(anim_name):
    if anim_name == "DamageFlash":
        damageable = true
    elif anim_name == "SpawnCube":
        damageable = true
        health_bar.fade_in()
    elif anim_name == "Attack":
        CombatHandler.switch_turn()


func _on_Tween_tween_completed(_object, _key):
    var tween = $Tween 
    tween.interpolate_property($Cube, "rotation", $Cube.rotation, $Cube.rotation + Vector3(1, 1, 1), 5, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
    tween.start()


func _on_Check_Attack_timeout():
    if CombatHandler.whos_turn() == "cube":
        attack_player()
        
func attack_player():
    var damage_to_player = int(floor(1 + rng.randi_range(0, PlayerVariables.floor_level)/2)) - PlayerVariables.armor
    PlayerVariables.health -= clamp(damage_to_player, 0, damage_to_player)
    $Flash.play("Attack")
    $PlayerHit.play()
    PlayerVariables.check_for_death()


func _on_PlayerAttack_finished():
        check_death()
        pass # Replace with function body.
