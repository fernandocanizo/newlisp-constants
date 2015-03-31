#!/usr/bin/env newlisp
;; Creation Date: Sat, 18 May 2013 07:33:15 -0300
;; @author Fernando Canizo (aka conan) - http://conan.muriandre.com/
;; @description Test Constants module using default mode: using separate modules to hold constants
;; @version 0


(load "Constants.lsp")

(Constants '(NewlispErrorCodes))

(dolist (a-constant (symbols NewlispErrorCodes))
	(println a-constant " = " (eval a-constant)))
