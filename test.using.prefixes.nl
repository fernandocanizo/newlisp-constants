#!/usr/bin/env newlisp
;; Creation Date: Sat, 18 May 2013 07:33:15 -0300
;; @author Fernando Canizo (aka conan) - http://conan.muriandre.com/
;; @description Test Constants module using prefixes
;; @version 0


(load "Constants.lsp")

(Constants '(NewlispErrorCodes) Constants:USE_PREFIXES)

(dolist (a-constant (symbols Constants))
	(println a-constant " = " (eval a-constant)))
