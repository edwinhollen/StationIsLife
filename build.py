import os
import sys
import json
import glob
import tempfile
import shutil
import subprocess
from distutils import dir_util

def build(project):	
	if os.path.exists(project["output"]):
		print("Cleaning up existing build directory...")
		for f in glob.glob(os.path.join(project["output"], "*")):
			os.unlink(f)
	print("Building...")
	# copy source files to temp dir
	with tempfile.TemporaryDirectory() as tempDir:
		for sourceDir in project["sources"]:
			dir_util.copy_tree(sourceDir, tempDir)
		# make archive
		gameZip = shutil.make_archive(os.path.join(project["output"], project["name"]), "zip", tempDir)
		# rename archive to .love and add version
		os.rename(gameZip, os.path.splitext(gameZip)[0]+" ("+project["version"]+").love")
		
			
def run(project):
	print("Running...")
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
	with open("project.json") as project_json:
		project = json.loads(project_json.read())
		build(project)
		if "--run" in sys.argv:
			run(project)