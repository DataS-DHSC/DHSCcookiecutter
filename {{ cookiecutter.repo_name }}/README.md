# `{{ cookiecutter.repo_name }}`

{{ cookiecutter.overview }}

```{warning}
Where this documentation refers to the root folder we mean where this README.md is
located.
```

## Getting started

To start using this project, [first make sure your system meets its
requirements](#requirements).

It's suggested that you install this pack and its requirements within a virtual environment.

## Installing the package (Python Only)

Whilst in the root folder, in the command prompt, you can install the package and its dependencies
using:

```shell
python -m pip install -U pip setuptools
pip install -e .
```
or use the `make` command:
```shell
make install
```

This installs an editable version of the package. Meaning, when you update the
package code, you do not have to reinstall it for the changes to take effect.
(This saves a lot of time when you test your code)

Remember to update the setup and requirement files inline with any changes to your
package. The inital files contain the bare minimum to get you started.

## Running the pipeline (Python only)

The entry point for the pipeline is stored within the package and called `run_pipeline.py`.
To run the pipeline, run the following code in the terminal (whilst in the root directory of the
project).

```shell
python src/{{ cookiecutter.repo_name.lower().replace(' ', '_').replace('-', '_') }}/run_pipeline.py
```

Alternatively, most Python IDE's allow you to run the code directly from the IDE using a `run` button.

## Required secrets and credentials

To run this project, [you need a `.secrets` file with secrets/credentials as
environmental variables][docs-loading-environment-variables-secrets]. The
secrets/credentials should have the following environment variable name(s):

| Secret/credential | Environment variable name | Description                                |
|-------------------|---------------------------|--------------------------------------------|
| Secret 1          | `SECRET_VARIABLE_1`       | Plain English description of Secret 1.     |
| Credential 1      | `CREDENTIAL_VARIABLE_1`   | Plain English description of Credential 1. |

Once you've added, [load these environment variables using
`.env`][docs-loading-environment-variables].

## Virtual environments

In programming we might work on several projects concurrently, each project depending on different packages of different versions. For example, our `project1` might require version `2.0.1` of `packageA`, and `project2` might require version `3.2.2` of that same `packageA`. If these versions are different enough, our `project1` and `project2` may not run with the wrong version of `packageA` installed. We use virtual environments so that all our projects can have separate, isolated environments with all their required dependencies inside, so working on one project does not disrupt our workflow in another.

### Python

* Documentation on virtual environments in Python is available [here](https://docs.python.org/3/tutorial/venv.html)
* With the repository as the current directory in console, run `conda env create -f environment.yml`. This will create a virtual environment called `{{ cookiecutter.repo_name.lower().replace('_', '-').replace(' ', '-') }}-env`.
* [*Optional*] If an environment called `{{ cookiecutter.repo_name.lower().replace('_', '-').replace(' ', '-') }}-env` already exists on your device, the above step will fail. Run `conda remove --name {{cookiecutter.project_name}}-env --all`, first ensuring you are ***NOT*** using the `{{ cookiecutter.repo_name.lower().replace('_', '-').replace(' ', '-') }}-env` environment. Then reattempt the previous step.
* To activate this virtual environment, run `conda`: `conda activate {{ cookiecutter.repo_name.lower().replace('_', '-').replace(' ', '-') }}-env`.
* When you are finished with this project, run: `conda deactivate`.


## Documentation

All functions contained in `.py` scripts in the `src` folder should have docstrings explaining what they do, what parameters are passed to the function, what errors the function can raise, and what the function outputs. The [`numpydoc` style](https://numpydoc.readthedocs.io/en/latest/example.html) of formatting docstrings is recommended. Scripts as a whole can contain their own docstrings, in much the same way as a function - simply contain a description of the module inside triple quotation marks `"""` at the top of the script. Examples of such documentation are contained in the `src` modules and submodules.

Having documentation in this way is crucial to meet the minimum requirments of a Reproducible Analytical Pipeline.

### Generating documentation

Once docstrings for functions and modules are put together, we can quickly and easily generate documentation using the [`sphinx`](https://www.sphinx-doc.org/en/master/) package, which is contained in the `{{ cookiecutter.repo_name.lower().replace('_', '-').replace(' ', '-') }}-env` conda environment in `environment.yml`. This is quick and easy to do, producing documentation in HTML form in the style of [Read the Docs](https://about.readthedocs.com/?ref=readthedocs.com). This presents all modules and functions in an easy to navigate environment with all relevant information, including source code, readily available.

Instructions for running `sphinx` are [here](docs/README.md).


## Code of Conduct

Please note that the {{cookiecutter.repo_name}} project is released with a [Contributor Code of Conduct](https://contributor-covenant.org/version/2/1/CODE_OF_CONDUCT.html). By contributing to this project, you agree to abide by its terms.

## License

Unless stated otherwise, the codebase is released under the MIT License. This covers
both the codebase and any sample code in the documentation. The documentation is ©
Crown copyright and available under the terms of the Open Government 3.0 licence.

## Contributing

[If you want to help us build, and improve `{{ cookiecutter.repo_name }}`, view our
contributing guidelines][contributing].

### Requirements

[```Contributors have some additional requirements!```][contributing]

- Python 3.6.1+ installed
{% if cookiecutter.using_R == "Yes" -%}
- R 4.0.4+ installed
{% endif -%}
- a `.secrets` file with the [required secrets and
  credentials](#required-secrets-and-credentials)
- [load environment variables][docs-loading-environment-variables] from `.env`

To install the contributing requirements, open your terminal and enter:
```shell
python -m pip install -U pip setuptools
pip install -e .[dev]
pre-commit install
```
or use the `make` command:
```shell
make install_dev
```

## Acknowledgements

[This project structure is based on the `govcookiecutter` template
project][govcookiecutter].

[contributing]: https://github.com/best-practice-and-impact/govcookiecutter/blob/main/%7B%7B%20cookiecutter.repo_name%20%7D%7D/docs/contributor_guide/CONTRIBUTING.md
[govcookiecutter]: https://github.com/best-practice-and-impact/govcookiecutter
[docs-loading-environment-variables]: https://github.com/best-practice-and-impact/govcookiecutter/blob/main/%7B%7B%20cookiecutter.repo_name%20%7D%7D/docs/user_guide/loading_environment_variables.md
[docs-loading-environment-variables-secrets]: https://github.com/best-practice-and-impact/govcookiecutter/blob/main/%7B%7B%20cookiecutter.repo_name%20%7D%7D/docs/user_guide/loading_environment_variables.md#storing-secrets-and-credentials
