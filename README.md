# You Seen This?

https://khasmek.github.io/you-seen-this

## Building epub/pdf

### MacOS

You will need to install Xcode Developer Tools as well as the Command Line Tools. See [here](https://developer.apple.com/downloads/index.action) (developer account required).

Install [Pandoc](https://github.com/jgm/pandoc/releases) and [MacTex](http://tug.org/mactex/). 

Add `export PATH=/Library/TeX/texbin:$PATH` to your .bashrc.

From the root dir just run `make`. The build subdir will contain the pdf and epub output.

### Ubuntu

You will need to install the `git`, `make`, `texlive`, `texlive-xetex` and `pandoc` packages.

From the root dir just run `make`. The build subdir will contain the pdf and epub output.

---
