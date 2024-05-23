class_name AllegroCore

var measure
var tempo
var key
var timeSignature

func changeCueState(cue):
	print(cue.name + cue.enabled)
	if cue.enabled == false:
		cue.enabled = true
	else:
		cue.enabled = false

func playClip(clip):
	print(clip.name)
