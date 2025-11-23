# `filehighl`

## Description

- This is a basic script to work with file highlight colors in thunar
- It can display, set and clear foreground or background colors set with gvfs 
- You need to **look through the script before running it** to configure!

## Requirements

### when is it expected to work
- For thunar, this feature was implemented in v4.17.9
	- Might work in other environments; not sure
- Written on linux with standard gnu tools
	- Hopefully interoperable with others

### `gio` vs `gvfs-info`
- This script uses `gio info` for operations
	- It might not be available on your system
	- There is another tool called `gvfs-info` which might be
- In which case you'd have to modify the script a bit
	- Please share the results
see also [wiki](https://codeberg.org/soas/filehighl/wiki/): [About the tools](https://codeberg.org/soas/filehighl/wiki/About-The-Tools): [`gio` vs `gvfs`](https://codeberg.org/soas/filehighl/wiki/About-The-Tools#gio-vs-gvfs)

## Use

### Install
1. Make the file executable:
```sh
chmod u+x filehighl
```
2. Put the script in your `PATH`
3. Restart your shell

### Run

#### Basic
To run on a specific file:
```sh
filehighl "path/to/file"
```

#### Use `find` 
gnu.org/software/findutils/

Run recursively on all items in current directory (`.`):
```sh
find . -exec filehighl "{}" \;
```

Run recursively in a specified directory; only on directories (`-t  d`) at depth 2-4 (`-mindepth 2 -maxdepth 4`)
```sh
find "/path/to/files" -mindepth 2 -maxdepth 4 -type d -exec filehighl "{}" \;&
```

#### Use `fd`

github.com/sharkdp/fd

Run recursively on all files in current directory (`.`):
```sh
fd . -x filehighl "{}" \;
```

Run recursively in a specified directory; only on files (`-t  f`):
```sh
fd . "/path/to/target" -t f -x filehighl "{}" \;
```

Run recursively in a specified directory; only on symlinks (`-t  l`) which haven't been modifed in >4 weeks (`--change-older-than 4weeks`).
```sh
fd . "/path/to/target" -t l --change-older-than 4weeks -x filehighl "{}" \;
```

## More information

See [wiki](https://codeberg.org/soas/filehighl/wiki/Home).

