extends Node

var active_scene = null

func _ready():
    var root = get_tree().get_root()
    active_scene = root.get_child(root.get_child_count() - 1)
    
func goto_scene(path):
    call_deferred("_deferred_goto_scene", path)
    
func _deferred_goto_scene(path):
    active_scene.free()
    var scene = ResourceLoader.load(path)
    active_scene = scene.instance()
    get_tree().get_root().add_child(active_scene)
    get_tree().set_current_scene(active_scene)
