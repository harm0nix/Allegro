extends Node2D

var cues
var clips
var rules
var conditions
var tags

var filepath = "res://Allegro_Data/"

func _ready():
	cues = loadJson(filepath + "logic.json").cues
	conditions = loadJson(filepath + "logic.json").conditions
	rules = loadJson(filepath + "logic.json").rules
	tags = loadJson(filepath + "logic.json").tags
	clips = loadJson(filepath + "clips.json")

func loadJson(path : String):
	if FileAccess.file_exists(path):
		var rawData = FileAccess.open(path, FileAccess.READ)
		var parsedFile = JSON.parse_string(rawData.get_as_text())
		
		if parsedFile is Dictionary:
			return parsedFile
		else:
			print("ALLEGRO>> Error reading file " + path)
			
	else:
		print("ALLEGRO>> File " + path + " does not exist")
