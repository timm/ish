
[![](https://raw.githubusercontent.com/timm/ish/master/etc/img/banner.png)](https://github.com/timm/ish/blob/master/README.md)[home](http://git.io/ish)
| [code](https://github.com/timm/ish/tree/master/src)
| [discuss](https://github.com/timm/ish/issues)
| [contribute](https://github.com/timm/ish/blob/master/CONTRIB.md)
| [cite](https://github.com/timm/ish/blob/master/CITATION.md)
| [&copy; 2018](https://github.com/timm/ish/blob/master/LICENSE.md)


[![](https://zenodo.org/badge/doi/10.5281/zenodo.1172230.svg)](https://github.com/timm/ish/blob/master/CITATION.md)

______


Please see the
[master readme](https://github.com/timm/ish/blob/master/README.md)




## file.lisp

File handling.



`reads (f &optional (fn #'print) (str t))`

-   Read  a file, calling 'fn' on each s-expression.



## fun.lisp

Functional programming tricks (e.g. memoing).



### General



`noop (&rest lst)`

-   the greatest meta function of all



Memoing



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



Examples of use for fun.lisp





## Hash.lisp

Hash function utilities.



`hash-keys (h)`

-   Return the keys of a hash table.



## Hasheg.lisp

Example of using hash.lisp.



`garnish (str &key toc)`

-   Output some markdown text.



## ish.lisp

Main control file for ISH.





## lib.lisp

Load file for all the standard lisp tricks.





## list.lisp

Tricks for handling lisp lists.



`l->a (lst)`

-   coerce list to array

`select (selector-fn facts)`

-   return all list items satisying selector-fn

`printm (lsts &key (out t) (sep ,) (underline -))`

-   pretty print a list of lists, lining up the columns



## Macro tricks



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



### Prining macros



`_oprim (x)`

-   worker tool for 'o'

`o (&rest l)`

-   Print a list of symbols and their bindings.



## rand.lisp

A platform independent random number generator.
Not as good as LISP's built in random number generator
but I could never figure our how to store or share the seed
of that generator. Hence this code.





## read,me.lisp

Tools for extracting documentation from LISP code.
Reads files, one s-expression at a time. Any `defuns`
are seleced and their function name arg list and
doc strings are printed.



`fundoc (x s)`

-   Takes the function documentation string and
   prints it, indented by a little white space

`readme `

-   Reading doco strings.



## string.lisp



`nchars (&optional (n 40) (c  ))`

-   returns 'n' copies of 'c'

`dot (&optional (c .))`

-   prints one chacracter, no new line, forced to output

`string-lines (str)`

-   divide a string into lines



## sys,lisp

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



## test.lisp

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



## tests.lisp

Runs all the unit tests.
Loads all tests before executing them
so the final count of 'pass' and 'fail'
are summed over all unit test files.





## thing.lisp

My simplications to CLOS
Everything is a 'thing' with a built-in print method.

### Simple nested accessor for CLOS instances or structs



`? (obj first-slot &rest more-slots)`

-   From https://goo.gl/dqnmvH:



Defthing (simpler that defclass).



`defslot (slot x form)`

-   helper function for defthing

`defthing (x parent &rest slots)`

-   simpler creator for claseses. see example in thingeg.lisp



Standard methods for all things.


