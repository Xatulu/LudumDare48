extends Spatial

func _ready():
    var rng = RandomNumberGenerator.new()
    rng.randomize()
    var light_color = Color(rng.randf_range(0.4, 0.8),rng.randf_range(0.4, 0.8),
        rng.randf_range(0.4, 0.8))
    $OmniLight3.light_color = light_color
    $OmniLight4.light_color = light_color
    $OmniLight5.light_color = light_color
    pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#    pass
