#!/usr/bin/env newlisp
;; Creation Date: Tue, 21 May 2013 15:11:07 -0300
;; @author Fernando Canizo (aka conan) - http://conan.muriandre.com/
;; @module XmlParseOptions
;; @description xml-parse options for the lazy programmer

(context 'XmlParseOptions)

(constant 'content-prefix "XPO")

(setq codes '(
	(1 "suppress whitespace text tags")
	(2 "suppress empty attribute lists")
	(4 "suppress comment tags")
	(8 "translate string tags into symbols")
	(16 "add sxml attribute tags") ; add SXML (S-expression XML) attribute tags (@ ...)
	))

(context MAIN)
