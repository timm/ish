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
2. Write `Xok.lisp` files with unit tests for `X.lisp` (see below).
3. Send pull request.
4. Easy!

## Writing Code files

To write a file for `ISH`, add the following two lines as a header:

      (unless (fboundp 'establish) (load 'ish))
      (establish 
         "other" 
	 "files" 
	 "to" 
	 "load")

- The first line loads ISH's `isp.lisp` code (the base level utils for the whole systems)
  if they have not already been loaded.
- The second line loads all other files, but again, only if they have 
not been loaded before.

## Unit test files

To write unit tests for `ISH` for file `X.lisp`,
create a file `Xok.lisp` whose first lines are:

      (unless (fboundp 'establish) (load 'ish))
      (establish
        "tests"
        "X" ; the code you want to test
      )

- In that file, write a function with the tests;
- Add `(test want got)` calls inside the function to check
  that the right tigns are being returned;
- Change the function's `defun` to `deftest`

Nest, at the last line of the `Xok.lisp`, add this line:

    (tests)

