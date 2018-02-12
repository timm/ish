[home](http://git.io.ish)
| [src](https://github.com/timm/ish/tree/master/src)
| [discuss](https://github.com/timm/ish/issues)
| [contribute](https://github.com/timm/ish/blob/master/CONTRIB.md)
| [cite](https://github.com/timm/ish/blob/master/CITATION.md)
| [license](https://github.com/timm/ish/blob/master/LICENSE.md)    
[![](https://raw.githubusercontent.com/timm/ish/master/etc/img/banner.png)](https://github.com/timm/ish/blob/master/README.md)

# A  Toolbox of Useful (ish) LISP Functions

## Install

      git clone http://github.com/timm/ish

To test this all works, then

      cd ish/src
      clisp tests

## How to Contrib

See [CONTRIB.md](CONTRIB.md)

## Tips

### Editing

      cd src
      vim -u ../.vim X.lisp

### Gitting

      git pull
      git commit -am "updating"; git push

### Running Files

Each file `X.lisp` knows its own dependancies so can be loaded seperately
to all the rest. E.g. (in clisp):

      cd src
      clisp X

Most files `X.lisp` comes with a  little executable tutorial on
how to use it in `Xok.lisp`.

Most of the code in these  tutorial are `deftest`s; i.e. unit tests
that check if the right thing is being generated by the functions.
To run  `X.lisp`'s  unit tests, just load its tutorial:

      cd src
      clisp Xok

### Regression Suite

To run all the unit tests, run:
  
      cd src
      clisp tests

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

Note the last line-- the ISH test suite has one failure built (so we can test that the unit tests
can catch failing tests).


