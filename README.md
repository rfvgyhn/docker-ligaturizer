# docker-ligaturizer
Run [ligaturizer][1] via container

# Usage
Create two directories: `/input` and `/output`. Place all fonts you wish to be ligaturized into `/input`. Create a one time use container and get your new fonts from the `/output` folder.

`docker run --rm -v $(pwd)/input:/input -v $(pwd)/output:/output --user $(id -u) rfvgyhn/ligaturizer`

## Volumes
* `/input` All fonts to be ligaturized
* `/output` Resuliting ligaturized fonts

## Options
The following environment variables are available. The values show the defaults used if the var isn't specified.

* `SUFFIX=ligaturized` Suffix to be used when naming the new font (e.g. consola.ttf -> consola-ligaturized.ttf)

# Example
Ligaturized Consolas

![Ligaturized Consolas][2]

[1]: https://github.com/ToxicFrog/Ligaturizer
[2]: screenshots/consolas-ligaturized.png