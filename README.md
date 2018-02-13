 
[![](https://raw.githubusercontent.com/timm/ish/master/etc/img/banner.png)](https://github.com/timm/ish/blob/master/README.md)[home](http://git.io/ish)
| [code](https://github.com/timm/ish/tree/master/src)
| [discuss](https://github.com/timm/ish/issues)
| [contribute](https://github.com/timm/ish/blob/master/CONTRIB.md)
| [cite](https://github.com/timm/ish/blob/master/CITATION.md)
| [&copy; 2018](https://github.com/timm/ish/blob/master/LICENSE.md)


[![](https://zenodo.org/badge/doi/10.5281/zenodo.1172230.svg)](https://github.com/timm/ish/blob/master/CITATION.md)


______

# Welcome!

<img align=right src="http://www.lisperati.com/lisplogo_warning_256.png">

Please enjoy tinkering with all my useful (ish)  LISP code.
I learn most about programming by reading code from other people.
Here, I present together some of their 
most useful LISP tricks (plus a few of my own). Enjoy!

The long term goal of this code is a DSL
for applications that readily combine
data mining with optimization.

But right now, `ISH` is just a bunch of cool little LISP tools.  To
help you understand it all, my code has no  huge monoliths. Instead:

- All code divides into lots of small files, independently executable and understandable.
- All  code files know their own dependencies so, to explore my code, load anything into LISP and see what happens
- If you want little worked examples on how to use code in any `X.lisp` file, look for `Xok.lisp`.

So just install your LISP (e.g. `clisp`), download this code, and go. 

## Uninstall (is easy)


This code needs no bash aliases; no magic shell variables that must be set;
no initialization of a package management system;
no ``just install these 17 packages inside the code editor''; and most important of all, 
no config files written outside of these directories. 

So if none of this code impresses you, you can kill it all with no side-effects using `rm -rf ish`.


## Install (is easy)

### Step1: Install LISP

Install `clisp` or `sbcl`. E.g. on a Mac:

      brew install clisp

Note that
this code has been tested
on CLISP <img align=middle src="https://clisp.sourceforge.io/clisp.png" height=30>
and  SBCL <img  align=middle src="http://www.sbcl.org/sbclbutton.png" height=30>.
I need a tester for Allegro. Anyone?

### Step2: Get Files  

#### Using`git clone`

      git clone http://github.com/timm/ish
      cd ish


#### Using a zip file


      wget https://github.com/timm/ish/archive/master.zip
      unzip master.zip
      cd ish-master

### Step3: Testing your installation


      cd src
      clisp tests
      # or
      sbcl --script tests.lisp

This should execute dozens of tests, one of which will fail (just to show that the test engine can catch failing tests).

## Tips

### Running Files

Each file `X.lisp` knows its own dependencies so can be loaded separately
to all the rest. E.g. (in clisp):

      cd src
      clisp X
      # or
      sbcl --script X.lisp

Most files `X.lisp` comes with a  little executable tutorial on
how to use it in `Xok.lisp`.

Most of the code in these  tutorial are `deftest`s; i.e. unit tests
that check if the right thing is being generated by the functions.
To run  `X.lisp`'s  unit tests, just load its tutorial:

      cd src
      clisp Xok
      # or
      sbcl --script Xok.lisp

### Regression Suite

To run all the unit tests, run:
  
      cd src
      clisp tests
      # or
      sbcl --script tests.lisp

This loads all the `*ok.lisp` files (in alphabetical order), then runs
all their tests.
That code outputs something like the following:

```
; stringok
; test
; string
; listok
; list
; testok
; macrook
; macro

;;; CHARS!
; seeking 3 characters

;;; FRED!
; seeking association list

;;; _AA
; should be one failure
; fail : expected 2

;;; DOITEMS!
; seeking association list

; pass : 4 =  80.0%
; fail : 1 =  20.0%
```

Note the last line-- the ISH test suite contains one 
deliberate failure (so we can test that the unit tests
can catch failing tests).

### Editing

I've been collecting my favorite VIM configs for editing files
(in general) and editing LISP (in particular). These can be access via:

      cd src
      vim -u ../.vim X.lisp

### Gitting

      git pull
      git commit -am "updating"; git push

Note that this distribution comes with a [.gitignore](.gitignore) that blocks
the usual temporaries from getting inappropriately added to git.

### Annoyances

This code was written to run in SBCL and CLISP. These implementations of LISP
go their own separate ways on many things, including CLOS. When I just cannot resolve
their differing approaches, I do something to dodge the problem (e.g. go to `defstruct`
rather than `defclass`, or building my own simpler class system called `defthing`).

____

## How to Contribute


<img src="http://gnss-sdr.org/assets/images/geniuss-contribute.png" width=300>  

See [CONTRIB.md](CONTRIB.md).


