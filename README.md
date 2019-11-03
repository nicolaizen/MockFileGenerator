# MockFileGenerator
Tool to create dummy files for testing.

Available filetypes are .bin, .gpg(encrypted), .pdf, .png, .txt, .zip, 7z and jpg.

## Installation
Run the following in the terminal:
```bash
$ chmod +x GenerateMockFiles.sh
```
In order to create gpg encrypted files the public key needs to be added through:
```bash
$ gpg --import public-key.gpg
```

## Usage
Note! The code uses relative paths so set the current/working directory to this repo before use.

Run 
```bash
$ ./GenerateMockFiles.sh
```
and follow the instructions.

Alternatively generation of a specific file type can be done through its respective script located under /generators.

These scripts have the following input scheme:
>
    Usage: ./{filetype}Generator.sh [OPTION]... LAST
       or: ./{filetype}Generator.sh [OPTION]... FIRST LAST
       or: ./{filetype}Generator.sh [OPTION]... FIRST INCREMENT LAST
       
Creating multiple samples of one sized file:
> ./{filetype}Generator.sh SIZE 0 AMOUNT

Its requires three inputs and increment set to zero.