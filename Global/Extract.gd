extends Node

var tracker_url = "https://solveig.oslo.no/anchoring-jtt.json"
var anchor_url = "https://solveig.oslo.no/anchoring-summary.json"

func json(content):
	return JSON.parse(content.get_string_from_utf8()).result


func points(content):
	return json(content)["JTT"][0]["track"]["segments"][1]

func last_pos(content):
	var result = json(content)["lastpos"]
	result.append(json(content)["ts"])
	return result

func anchor_pos(content):
	content = json(content)
	return Vector2(content["estimated_anchorpos"][0], content["estimated_anchorpos"][1])

func box_pos(content):
	return json(content)["box"]

func geo(x): return Vector2(x[0], x[1])
