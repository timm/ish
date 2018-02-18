[![](https://raw.githubusercontent.com/timm/ish/master/etc/img/banner.png)](https://github.com/timm/ish/blob/master/README.md)[home](http://git.io/ish)
| [code](https://github.com/timm/ish/tree/master/src)
| [doc](https://github.com/timm/ish/blob/master/src/README.md)
| [discuss](https://github.com/timm/ish/issues)
| [contribute](https://github.com/timm/ish/blob/master/CONTRIB.md)
| [cite](https://github.com/timm/ish/blob/master/CITATION.md)
| [&copy; 2018](https://github.com/timm/ish/blob/master/LICENSE.md)


[![](https://zenodo.org/badge/doi/10.5281/zenodo.1172230.svg)](https://github.com/timm/ish/blob/master/CITATION.md)


______


# How to contribute to ISH

## Process

0. Clone.
1. Write `X.lisp` files (see below).
2. Write `Xeg.lisp` files with unit tests for `X.lisp` (see below).
3. Send pull request.
4. Easy!


## Write code  for multiple LISP implemenetations:

I use `clisp` and `sbcl`. The former is simpler to use (no hyper-verbose error strings)
while the latter is good for raw speed (so I code in one and deploy in the other). 

For functions that are different in different implementations,
add code in [src/sys.lisp](src/sys.lisp) to abstract away those differences. 

To
check that the code works for both versions of lisp, run the test suite:

      clisp tests
      sbcl --script tests.lisp

## Typing Standards

- Indent using 2 characters (no tabs);
- Max width less than 80 characters;
- No camel case function, macro, method or class names. E.g. do `init-sys` rather than `initSys`;
- No `&aux` on outer level functions, methods (but they are fine for `labels` functions).

## Annotate code to make it  _public_ and _private_  

Private functions, methods, and macros have no docstring or start with "\_";

All other code is public. All public code can be exposed to the outside world via the following
tools. That said **do not run these tools** (or, if you do, do not add their output
as part of a pull request):

    clisp readme    > README.md  # collects documentation; see below
    clisp asd       > ish.asd    # builds a system definition file
    clisp defsystem > package.lisp # builds the defsystem file.

## Each file should be executed.

Each `X.lisp` file should be executable via (e.g. `clisp X`).
This means that each file must know its own dependances, which is achieved
using  the `establish` command (found in the `ish` file):

      ; top of file
      (unless (fboundp 'establish) (load 'ish))
      (establish 
         "other" 
	       "files" 
	       "to" 
	       "load")

## Each file should be testable

Write one `Xeg.lisp` unit test files  for the  `X.lisp` files.
The first few lines of that file are:

      ; top of file
      (unless (fboundp 'establish) (load 'ish))
      (establish
        "tests"
        "X" ; the code you want to test
      )

In that file, write a function with the tests;
Add `(test want got)` calls inside the function to check
that the right tigns are being returned;
Change the function's `defun` to `deftest`

Nest, at the last line of the `Xeg.lisp`, add this line:

    (tests)

To run the tests for one file use

    sbcl --script Xeg.file
    clisp Xeg
    
To run all tests (in alphabetical order of the test files), use


    sbcl --script tests.lisp
    clisp tests

## Each file should be documented.

You can `garnish` your code with Markdown snippets.

      (garnish "
      ;;; Some stuff to be **rendered** in _Markdown__
      ;;; ")

Also, you can add comments in function docstrings:

      (defun demo-function (a)
          "Showing off the doco"
        (+ a 1))

All this documentation can be collected using, say:

      clisp readme > README.md

All the `garnish`es will be written as output
but only the docstrings from _public_ methods, functions, and macros will be collected.
