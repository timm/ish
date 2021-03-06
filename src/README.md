
[![](https://raw.githubusercontent.com/timm/ish/master/etc/img/banner.png)](https://github.com/timm/ish/blob/master/README.md)[home](http://git.io/ish)
| [code](https://github.com/timm/ish/tree/master/src)
| [doc](https://github.com/timm/ish/blob/master/src/README.md)
| [discuss](https://github.com/timm/ish/issues)
| [contribute](https://github.com/timm/ish/blob/master/CONTRIB.md)
| [cite](https://github.com/timm/ish/blob/master/CITATION.md)
| [&copy; 2018](https://github.com/timm/ish/blob/master/LICENSE.md)


[![](https://zenodo.org/badge/doi/10.5281/zenodo.1172230.svg)](https://github.com/timm/ish/blob/master/CITATION.md)

______

# Some Useful(ish) Documentation

This page is auto-generated using:

      clisp readme > README.md

For high-level notes on this work, please see the
[master readme](https://github.com/timm/ish/blob/master/README.md).



<img src='https://goo.gl/m8uxAf' height=10 width=900>


## [ASD.LISP](asd.lisp)

Generates an asf file from the public methods
and in this directory.

Example usage:

````
clisp asd > fft.asd
````



`asd (&optional (what ish))`

-   Generates an asd file


<img src='https://goo.gl/m8uxAf' height=10 width=900>


## [COL.LISP](col.lisp)

Maintain information about a column of
numbers or symbols





Different column types are denoted by
different symbols.





Columns are places where you add items

Columns have a `name`, and fall into some
`pos` inside a `table`.



`add ((c col) x)`

-   Add numbers to column.



Some columns hold `num`bers.



`valid ((n num) x)`

-   Numbers have to be numbers.

`add1 ((nu num) x)`

-   New numbers update `min` and `max`.

`norm ((n num) x)`

-   Convert x to the range 0..1.



Some columns hold `sym`bols.

`Counts` how many symbols are in this
column; `mode` is the most common symbol.



`valid ((s sym) x)`

-   Anything is valid in a `sym` column.

`add1 ((s sym) x)`

-   Increment the symbols counts,
   update `mode` when necessary.

`norm ((s sym) x)`

-   Normalize symbols does nothing.


<img src='https://goo.gl/m8uxAf' height=10 width=900>


## [DEFSYSTEM.LISP](defsystem.lisp)

Generates a defsystem file from the public methods
and in this directory.

Example usage:

````
clisp defsystem > package.lisp
````



`print-defsystem (&optional (what ish))`

-   Generates a defsystem file


<img src='https://goo.gl/m8uxAf' height=10 width=900>


## [FILE.LISP](file.lisp)

File handling.



`reads (f &optional (fn #'print) (str t))`

-   Read  a file, calling 'fn' on each s-expression.

`public-files-methods `

-   Returns two values: the public functions and files.


<img src='https://goo.gl/m8uxAf' height=10 width=900>


## [FUN.LISP](fun.lisp)

Functional programming tricks (e.g. memoing).



### General



`noop (&rest lst)`

-   the greatest meta function of all



### Memoing



`memo (fn &key (key #'first) (test #'eql) name)`

-   Low-level memoing workhorse.

`memoize (fn-name &key (key #'(lambda (args) (first args))) (test #'eq))`

-   Replace fn-name's global definition with a memoized version.

`clear-memoize (fn-name)`

-   Clear the hash table from a memo function.

`defmemo (fn args &body body)`

-   Standard memoing functions: indexes on first arg.

`defone (fn args &body body)`

-   Memoing function for structs/instances with an id slot.


<img src='https://goo.gl/m8uxAf' height=10 width=900>


## [HASH.LISP](hash.lisp)

Hash function utilities.



`hash-keys (h)`

-   Return the keys of a hash table.


<img src='https://goo.gl/m8uxAf' height=10 width=900>


## [ISH.LISP](ish.lisp)

Main control file for ISH.




<img src='https://goo.gl/m8uxAf' height=10 width=900>


## [KEEPER.LISP](keeper.lisp)

`keeper` is a thing with a unique `id`
that holds a cache `_cache` of kept stuff.
For an example of usage, see [keepereg.lisp](keepereg.lisp).




`keep (it &body body)`

-   using the hash table _cache, compute this once, then keep it


<img src='https://goo.gl/m8uxAf' height=10 width=900>


## [LIB.LISP](lib.lisp)

Load file for all the standard lisp tricks.




<img src='https://goo.gl/m8uxAf' height=10 width=900>


## [LIST.LISP](list.lisp)

Tricks for handling lisp lists.



`head (lst)`

-   Return first item

`tail (lst)`

-   Return last item

`l->a (lst)`

-   coerce list to array

`select (selector-fn facts)`

-   return all list items satisying selector-fn

`printm (lsts &key (out t) (sep ,) (underline -))`

-   pretty print a list of lists, lining up the columns


<img src='https://goo.gl/m8uxAf' height=10 width=900>


## [MACRO.LISP](macro.lisp)



###  General stuff



`aif (test then &optional else)`

-   Anaphoric 'if'



### Iteration macros



`doitems ((one n list &optional out) &body body)`

-   Set 'one' and 'n' to each item in a list, and its position.

`doh ((k v h &optional out) &body body)`

-   Set key 'k' and value 'v' to each item in a list, and its position.

`while (test &body body)`

-   implements 'while' (which is not standard in LISP)

`until (test &body body)`

-   implements 'until' (which is not standard in LISP)



### Printing macros



`o (&rest l)`

-   Print a list of symbols and their bindings.


<img src='https://goo.gl/m8uxAf' height=10 width=900>


## [RAND.LISP](rand.lisp)

A platform independent random number generator.
Not as good as LISP's built in random number generator
but I could never figure our how to store or share the seed
of that generator. Hence this code.




<img src='https://goo.gl/m8uxAf' height=10 width=900>


## [README.LISP](readme.lisp)

Tools for extracting documentation from LISP code.
Reads files, one s-expression at a time. Any `defuns`
are seleced and their function name arg list and
doc strings are printed.



`fundoc (x s)`

-   Takes the function documentation string and
   prints it, indented by a little white space

`readme `

-   Reading doco strings.


<img src='https://goo.gl/m8uxAf' height=10 width=900>


## [STRING.LISP](string.lisp)



`nchars (&optional (n 40) (c  ))`

-   returns 'n' copies of 'c'

`dot (&optional (c .))`

-   prints one chacracter, no new line, forced to output

`string-lines (str)`

-   Convert a string to a list of lines.

`starts-with-p (str1 str2)`

-   Determine whether `str1` starts with `str2`

`ends-with-p (str1 str2)`

-   Determine whether `str1` ends with `str2`

`containsp (str1 str2)`

-   Determine whether `str1` contains `str2`.
   Instead of just returning T, return a list of starting locations
   for every occurence of `str2` in `str1`


<img src='https://goo.gl/m8uxAf' height=10 width=900>


## [SYS.LISP](sys.lisp)

Here I'm attempting to localize all the stuff
that is implementation dependent.



`klass-slots (it)`

-   what are the slots of a class?

`klass-slot-definition-name (x)`

-   what is a slot's name?

`args `

-   what are the command line args?

`stop `

-   how to halt the program?


<img src='https://goo.gl/m8uxAf' height=10 width=900>


## [TEST.LISP](test.lisp)

A tiny unit test engine in LISP.
This code lets us define and call tests in two ways.

Firstly, we can run one isoalted set of tests.
E.g. it Xeg.lisp ends in '(tests)', then loading
that file runs the associated tests for `X.lisp`.

Secondly, we can load all the tests BEFORE
running anything. E.g. the file tests.lisp
pushes :dont-test onto *features* then loads
all the *eg.lisp files. The tests are then run
all together by call `tests` with the optional
`force` arguement set.



`deftest (name params &optional (doc ) &body body)`

-   Create a new test, adding its name to the list of *tests*.


<img src='https://goo.gl/m8uxAf' height=10 width=900>


## [TESTS.LISP](tests.lisp)

Runs all the unit tests.
Loads all tests before executing them
so the final count of 'pass' and 'fail'
are summed over all unit test files.




<img src='https://goo.gl/m8uxAf' height=10 width=900>


## [THING.LISP](thing.lisp)

My simplications to CLOS
Everything is a 'thing' with a built-in print method.

### Simple nested accessor for CLOS instances or structs



`? (obj first-slot &rest more-slots)`

-   From https://goo.gl/dqnmvH:



### Defthing (simpler that defclass).



`defslot (slot x form)`

-   helper function for defthing

`defthing (x parent &rest slots)`

-   simpler creator for claseses. see example in thingeg.lisp



Standard methods for all things.



`public-slot-names ((it thing))`

-   return all thing slots that don't start with '_'

`print-object ((it thing) out)`

-   print string for all public slot names


<img src='https://goo.gl/m8uxAf' height=10 width=900>


## [TIME.LISP](TIME.lisp)

Functions for handking time.



`current-date-string `

-   Returns current date as a string.

`current-year `

-   Returns current year.
