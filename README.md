# Prettify
### Zsh script to linter and format your python project

## What it does
Formats and checks your python code with
- `autoflake`
- `isort`
- `black`
- `flake8`
- `mypy`  
in this order

You can execute script on python file or a directory, to prettify all files in it

It will load config from the [configuration file](https://github.com/whyh/Prettify/blob/826613a80834f72377f13f7a3527f1c9c80b2b0d/prettify.zsh#L4) in the running directory and falls back to [the default](https://github.com/whyh/Prettify/blob/master/prettify.zsh#L3) when can't find one  

Please note that `black` and `autoflake` do not support `setup.cfg`. Instead you can modify their running options [here](https://github.com/whyh/Prettify/blob/826613a80834f72377f13f7a3527f1c9c80b2b0d/prettify.zsh#L16)

## Initial Setup
```python3
pip install autoflake black flake8 isort mypy
```

Change `DEFAULT_CONFIG_PATH` to your's default `setup.cfg` [here](https://github.com/whyh/Prettify/blob/master/prettify.zsh#L3)  
[Here](/setup.cfg) is an example of the default `setup.cfg`

## How to run
Make sure `CONFIG_PATH` is pointing to project `setup.cfg` [here](https://github.com/whyh/Prettify/blob/826613a80834f72377f13f7a3527f1c9c80b2b0d/prettify.zsh#L4) if your project has one. By default it will look for `setup.cfg` in the running directory

Make sure `VENV_PATH` is pointing to project virtual environment folder [here](https://github.com/whyh/Prettify/blob/master/prettify.zsh#L5). By default it point to `venv` in the running directory. This is important for `isort`

### CLI
`python prettify.py <path_to_file_or_directory>`

### PyCharm external tool
Configure your external tool the following way

![](../assets/PyCharm_external_tools.png)

Now select file/folder in the project view or start editing a file, open right mouse klick menue and choose prettify

### PyCharm shortcut
Configure your shortcut the following way

![](../assets/PyCharm_keyboard_shortcuts.png)

Now select any file/folder in the project view, or start editing a file and press the shortcut on your keyboard
 
