# docker-vscode-latex-gdojo

A [Dojo](https://github.com/kudulab/dojo) docker image with tools for creating Latex documents.

## Specification
The image contains:
 * Visual Studio Code
 * Visual Studio Code extensions: James-Yu.latex-workshop,
 streetsidesoftware.code-spell-checker
 * LaTeX

Based on [this tutorial](https://pmateusz.github.io/latex/2018/01/30/vs-code-latex-editor.html).

## Usage
1. Install [Dojo](https://github.com/kudulab/dojo)
2. Provide a Dojofile:

```
DOJO_DOCKER_IMAGE="kudulab/vscode-latex-gdojo:0.1.0"
```

3. Run `dojo` to make Dojo run a Docker container.
4. Inside the container you can run e.g.:

```bash
# start Visual Studio Code IDE
code &
# compile LaTeX
pdflatex -interaction=nonstopmode -file-line-error main.tex
bibtex main
pdflatex -interaction=nonstopmode -file-line-error main.tex
```

By default current directory in Docker container is `/dojo/work`.

### Compile in Visual Studio Code
In order to compile your `*.tex` files to pdf, create a `.vscode/tasks.json` file
 like [this tutorial](https://pmateusz.github.io/latex/2018/01/30/vs-code-latex-editor.html)
 instructs or see the example in this repository in `tests/integration/test_dojo_work`.
 Then, press Ctrl+Shift+B.

### Compile from cli

Assuming that your LaTeX file is called `main.tex`:
```
pdflatex -interaction=nonstopmode -file-line-error main.tex
```

### Using a bibliography/references
This Docker image uses bibtex+bibtex. A separate file to keep the bibliography is needed. By convention its extension is:  `.bib`. Each time you change the bibliography file, you have to run `bibtex`. Assuming that your LaTeX file is called `main.tex`:
```
# do not run: `bibtex main.tex`
bibtex main
```

A full compilation from cli:
```
pdflatex -interaction=nonstopmode -file-line-error main.tex
bibtex main
pdflatex -interaction=nonstopmode -file-line-error main.tex
```

## Operations

### Build the image locally

```
./tasks build_local
```

### Test the image

```
./tasks itest
```

The integration tests will create a pdf file: `test/integration/test_dojo_work/main.pdf`.

### Troubleshooting
When you have problems building the docker image and the error says:
```
System limit for number of file watchers reached
```
See: https://stackoverflow.com/a/55543310/4457564

## Acknowledgements

Special thanks to:
   * [Michał Kącki](https://github.com/Nefendi) for suggesting a solution using Visual Studio Code
   * [Ramzi Hadrich](https://github.com/hadrrb) for the initial LaTeX template

## License

 Copyright 2019 Ewa Czechowska, Tomasz Sętkowski

 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at

     http://www.apache.org/licenses/LICENSE-2.0

 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
