# docker-ligaturizer
Run [ligaturizer][1] via container

# Usage
Create an output directory called `/output`. Create and run the one time use container and get your new font from the `/output` folder.

### Bash
`docker run --rm -v $(pwd)/your-font.ttf:/input -v $(pwd)/output:/output --user $(id -u) rfvgyhn/ligaturizer`

### Powershell
`docker run --rm -v "$($pwd.Path -replace '^|\\+','/' -replace ':')/your-font.ttf:/input" -v "$($pwd.Path -replace '^|\\+','/' -replace ':')/output:/output" rfvgyhn/ligaturizer`

## Volumes
* `/input` The font to be ligaturized
* `/output` Resulting ligaturized font directory

## Options
The following environment variables are available. The values show the defaults used if the var isn't specified.

* `PREFIX=` Prefix to be used when naming the new font (e.g. consola.ttf -> ligaturizedConsolas.ttf)
* `OUTPUT_NAME=` Resulting font name (defaults to "_fontName_ Ligaturized")

# Example
Ligaturized Consolas

![Ligaturized Consolas][2]

[1]: https://github.com/ToxicFrog/Ligaturizer
[2]: screenshots/consolas-ligaturized.png