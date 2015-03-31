#!/usr/bin/env newlisp
;; Creation Date: Tue, 21 May 2013 16:09:58 -0300
;; @author Fernando Canizo (aka conan) - http://conan.muriandre.com/
;; @module SetLocaleOptions
;; @description Options for set-locale

;; @notes
;; values taken from /usr/include/bits/locale.h on a Linux box
;; options used by set-locale

(context 'SetLocaleOptions)

(constant context-prefix "") ; they already have LC_ prepended

(setq codes '(
	(0 "LC_CTYPE")
	(1 "LC_NUMERIC")
	(2 "LC_TIME")
	(3 "LC_COLLATE")
	(4 "LC_MONETARY")
	(5 "LC_MESSAGES")
	(6 "LC_ALL")
	(7 "LC_PAPER")
	(8 "LC_NAME")
	(9 "LC_ADDRESS")
	(10 "LC_TELEPHONE")
	(11 "LC_MEASUREMENT")
	(12 "LC_IDENTIFICATION")
	))

(context MAIN)
