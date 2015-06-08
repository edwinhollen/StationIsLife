import os 
import json
import subprocess
import shutil
import glob
import sys

def run():
	print("Running...")
	with open("project.json") as project_json:
		project = json.loads(project_json.read())


		p = subprocess.Popen(
			[
				shutil.which("love"), 
				glob.glob(os.path.join(project["output"], "*.love"))[0],
				"--console"
			],
			stdout=subprocess.PIPE,
			stderr=subprocess.PIPE
		)
		
		
if __name__ == '__main__':
	run()