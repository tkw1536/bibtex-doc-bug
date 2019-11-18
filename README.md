# BiBTeX Documentation Bug

This repo is intended to demonstrate an issue with the BibTeX documentation. 

## the documentation

["Designing BIBTEX Styles"](http://texdoc.net/texmf-dist/doc/bibtex/base/btxhak.pdf), page 9, at the very top states that:

Suppose a database entry has the field

    author = "Charles Louis Xavier Joseph de la Vall{\’e}e Poussin"

and suppose you want this formatted "last name comma initials". If you use the format string

    "{vv~}{ll}{, jj}{, f}?"

BibTEX will produce

    de~la Vall{\’e}e~Poussin, C.~L. X.~J?

as the formatted string.

## the Problem

In the `demo` folder of this repository you can find three files:

1. `example.bib` which contains a single entry with an author field `author = "Charles Louis Xavier Joseph de la Vall{\’e}e Poussin"`
2. an `example.bst` file which only formats authors using `{vv~}{ll}{, jj}{, f}?`
3. the `input.tex` file, which uses `example.bib` and `example.bst` and cites the singular entry

According to the documentation, one would expect that

```
tex input
bibtex input
```

produces an `input.bbl` file containing only the following:

```
de~la Vall{\’e}e~Poussin, C.~L. X.~J?
```

However, it instead produces:

```
de~la Vall{\’e}e~Poussin, C. L. X.~J?
```

(There is a ~ missing between C. and L. )

## Versions

This was tested using TeXLive 2018 with the following versions:

```
$ tex --version
TeX 3.14159265 (TeX Live 2018)
kpathsea version 6.3.0
Copyright 2018 D.E. Knuth.
There is NO warranty.  Redistribution of this software is
covered by the terms of both the TeX copyright and
the Lesser GNU General Public License.
For more information about these matters, see the file
named COPYING and the TeX source.
Primary author of TeX: D.E. Knuth.
```

```
$ bibtex --version
BibTeX 0.99d (TeX Live 2018)
kpathsea version 6.3.0
Copyright 2018 Oren Patashnik.
There is NO warranty.  Redistribution of this software is
covered by the terms of both the BibTeX copyright and
the Lesser GNU General Public License.
For more information about these matters, see the file
named COPYING and the BibTeX source.
Primary author of BibTeX: Oren Patashnik.
```