#!/bin/bash

source /opt/rh/rh-python38/enable

PYTHON_PROJECTS_DIR=~/python-sync/projects

for PROJECT in `ls ${PYTHON_PROJECTS_DIR}`
do
        echo "[${PROJECT}]"
        echo -e
        cd ${PYTHON_PROJECTS_DIR}/${PROJECT}
        python -m venv venv
	source venv/bin/activate	
	pip --no-cache-dir install --upgrade pip
	pip --no-cache-dir download --requirement requirements.txt --dest packages
	deactivate
        echo -e
done

cd ~
