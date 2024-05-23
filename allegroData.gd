var cues = {}
var clips = {}
var rules = {}

var filepath = "res://allegroData/"

func _ready():
	cues = loadJson(filepath + "cues.json")
	clips = loadJson(filepath + "clips.json")
	rules = loadJson(filepath + "rules.json")
	
func loadJson(path : String):
	if FileAccess.file_exists(path):
		var rawData = FileAccess.open(path, FileAccess.READ)
		var parsedFile = JSON.parse_string(rawData.get_as_text())
		
		if parsedFile is Dictionary:
			return parsedFile
		else:
			print("ALLEGRO>> Error reading file " + path)
	else:
		print("ALLEGRO>> File " + path + "does not exist")
