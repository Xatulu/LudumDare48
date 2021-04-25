extends Sprite3D

onready var health_bar = $Viewport/HealthBar2D

func _ready():
    texture = $Viewport.get_texture()

func update(value, full) -> void:
    health_bar.update_bar(value, full)

func fade_in() -> void:
    var tween = $Tween
    tween.interpolate_property(self, "opacity", 0, 1, 1, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
    tween.start()
