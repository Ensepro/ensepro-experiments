#! /usr/bin/python3
import json
import sys

with open(sys.argv[1]) as arq:
        dataQ = json.load(arq)

for questions in dataQ["questions"] :
	for question in questions["question"]:
		if question["language"] == "pt" or question["language"] == "pt_BR":
			print(question["string"])
