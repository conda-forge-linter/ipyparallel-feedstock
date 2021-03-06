REM enable extensions via conf.d files for notebook >= 5.3
set "ETC=%CONDA_PREFIX%\etc\jupyter"
set "SERVER_CONFIG=%ETC%\jupyter_notebook_config.d"
set "TREE_CONFIG=%ETC%\nbconfig\tree.d"
if not exist "%SERVER_CONFIG%" mkdir "%SERVER_CONFIG%"
if not exist "%TREE_CONFIG%" mkdir "%TREE_CONFIG%"
copy "%RECIPE_DIR%\serverextension.json" "%SERVER_CONFIG%\ipyparallel.json"
copy "%RECIPE_DIR%\nbextension.json" "%TREE_CONFIG%\ipyparallel.json"
pip install --no-deps .
jupyter nbextension install --sys-prefix --py ipyparallel
