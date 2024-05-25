extends Node2D
class_name AllegroCore

var songInfo
var cues
var conditions
var rules
var tags

func _ready():
	reset()

func _process(_delta):
	for rule in rules:
		if tags.get(rule.split(".")[2]) == true:
			if rules.get(rule) == false:
				var components = rule.split(".")
				if cues[components[1]] == true:
					playClip(components[3])
					rules[rule] = true
			else:
				var components = rule.split(".")
				if cues[components[1]] == false:
					stopClip(components[3])
					rules[rule] = false
		else:
			rules[rule] = false

func playClip(clip):
	print("ALLEGRO>> playing " + AllegroData.clips[clip].name)
	
func stopClip(clip):
	print("ALLEGRO>> stopped playing " + AllegroData.clips[clip].name)
	
func reset():
	print("ALLEGRO>> cues, rules, tags, and song data reset")
	songInfo = {"measure": 0, "beat": 1, "tempo": 100, "key": "C", "timeSignature": "4/4"}
	cues = AllegroData.cues
	rules = AllegroData.rules
	tags = AllegroData.tags
	conditions = AllegroData.conditions
