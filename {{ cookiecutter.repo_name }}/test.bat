eval $(conda shell.bash hook)
source activate {{ cookiecutter.repo_name.lower().replace('_', '-').replace(' ', '-') }}-env
conda list
git init
pre-commit install
