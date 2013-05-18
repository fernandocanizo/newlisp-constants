newlisp-constants
=================

newLISP constants for the lazy programmer

A module to programmatically create useful constants to write less cryptic code.

Might be useful when you read others code or come back to your own code after a
while and find stuff like this:

`(if (= 4 ((last-error) 0)) ...) ; what stands "4" for?`

Instead of that, you can write:

`(if (= Constants:NEC_PROBLEM_ACCESING_FILE ((last-error) 0)) ...) ; Oh, I see`

The constants can be created all inside "Constants" context with prefixes to
distinguish different sets, or can be in separate contexts.


Usage:
======

```
; each set of constants in separate context (default mode)
(load "Constants.lsp")
(Constants '(NewlispErrorCodes NetErrorCodes SysErrorCodes))

; check them
(symbols NewlispErrorCodes)

; all sets in Constants context appropriatelly prefixed
(load "Constants.lsp")
(Constants '(NetErrorCodes SysErrorCodes) Constants:USE_PREFIXES)
```

Module Creation:
================

To add new modules just create a file with the same name as the context you will
use. And inside it create a "codes" symbol holding a list of value/description
lists and a "context-prefix" symbol holding the prefix you will want to use for
the prefixed case.

Example template:

```
; save it in file "ExampleFooBar.lsp"

(context 'ExampleFooBar)

(constant 'context-prefix "EFB")

(setq codes '(
	(0 "value 0")
	(1 "value 1")
	...))

(context MAIN)
```

TODO:
=====

Besides TODO notes inside code, add modules for:

- Regular expressions: directory, ends-with, find, find-all, member, parse, regex,
regex-comp, replace, search, starts-with

- XML: xml-parse (also define composites, e.g. SXML = 31 (+ 1 2 4 8 16) )

- Multiprocessing: destroy, signal, process (on Windows), wait-pid

- Application exit: exit

- Directory masks: make-dir

- Localization: set-locale

- Timer: timer
