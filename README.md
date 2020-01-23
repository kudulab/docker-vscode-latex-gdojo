# docker-vscode-latex-gdojo

A [Dojo](https://github.com/kudulab/dojo) docker image with tools for creating Latex documents.

## Specification
The image contains:
 * Visual Studio Code
 * Visual Studio Code extensions: James-Yu.latex-workshop,
 streetsidesoftware.code-spell-checker

Based on [this tutorial](https://pmateusz.github.io/latex/2018/01/30/vs-code-latex-editor.html).

## Usage
1. Install [Dojo](https://github.com/kudulab/dojo)
2. Provide an Dojofile:

```
DOJO_DOCKER_IMAGE="kudulab/vscode-latex-gdojo:0.1.0"
```

3. Run, example commands:

```bash
dojo
code &
```

In order to compile your `*.tex` files to pdf, create a `tasks.json` file
 like [this tutorial](https://pmateusz.github.io/latex/2018/01/30/vs-code-latex-editor.html)
 instructs or see the example in this repository in tests/integration/test_dojo_work.
 Then, press Ctrl+Shift+B.

By default current directory in docker container is `/dojo/work`.


## Troubleshooting
When you have problems building the docker image and the error says:
```
System limit for number of file watchers reached
```
See: https://stackoverflow.com/a/55543310/4457564


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
