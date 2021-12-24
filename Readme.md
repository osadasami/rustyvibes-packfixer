# Packfixer for Rustyvibes

Use this repository if a custom [Mechvibes sound-pack](https://docs.google.com/spreadsheets/d/1PimUN_Qn3CWqfn-93YdVW8OWy8nzpz3w3me41S8S494/edit#gid=0) is using a single audio file configuration. This repository converts the audio files to a format that can be used by [Rustyvibes](https://github.com/kb24x7/rustyvibes)

1. Download soundpack
2. Make sure config looks like that

```json
{
	...
  "sound": "purple.ogg",
  "defines": {
    "1": [
      1088,
      118
    ],
	...
```

3. Make sure filename match the one in config. `"sound": "sound.ogg"` -> `./soundpack/sound.ogg`

4. Rename `config.json` to `config_old.json`

5. Run `ruby main.rb cherrymx-black-abs`

6. Script will cut one audio file to multiple, will store these files in soundpack folder and will create `config.json`

7. Run `rustyvibes cherrymx-black-abs`

8. Enjoy

Dependencies

```
ffmpeg
```

