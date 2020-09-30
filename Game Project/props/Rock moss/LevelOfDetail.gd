extends Spatial

# LOD Distance Settings
export (float) var lod_distance_0 = 400
export (bool) var lod_culling = true

# Find "Camera" from Root scene. Name must be exact "Camera"
export (bool) var auto_detect_camera = true

# Or, you can specify the camera from Inspector or from Script
export (NodePath) var camera

var enabled = true
var mesh_lod0


func _ready():
	if auto_detect_camera:
	 camera = get_tree().get_root().find_node("Camera", true, false)
	
	if typeof(camera) == TYPE_NODE_PATH:
		camera = get_node(camera)
		
	if camera == null:
		print("Camera not found. LOD will not work.")
		set_process(false)
		return
		
	mesh_lod0 = $"."

		
	update_lod()
	
func _process(delta):
	if enabled == false:
		return

	update_lod()
	
func get_distance_to_camera() -> float:
	var camera_translation = camera.get_global_transform().origin
	var object_translation = get_global_transform().origin
	
	return camera_translation.distance_to(object_translation)
	
func update_lod():
	var distance = get_distance_to_camera()
	if distance <= lod_distance_0:
		mesh_lod0.visible = true
	else:
		if lod_culling:
			mesh_lod0.visible = false
		else:
			mesh_lod0.visible = false
		
