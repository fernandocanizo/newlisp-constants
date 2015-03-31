#!/usr/bin/env newlisp
;; Creation Date: Tue, 21 May 2013 16:18:53 -0300
;; @author Fernando Canizo (aka conan) - http://conan.muriandre.com/
;; @module TimerOptions
;; @description Options for timer function

(context 'TimerOptions)

(constant context-prefix "TO")

(setq codes '(
	(0 "REAL_TIME") ; default
	(1 "USER_TIME")
	(2 "PROFILING_TIME")
	))

(context MAIN)
