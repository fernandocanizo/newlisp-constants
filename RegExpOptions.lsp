#!/usr/bin/env newlisp
;; Creation Date: Mon, 20 May 2013 09:11:16 -0300
;; @author Fernando Canizo (aka conan) - http://conan.muriandre.com/
;; @module RegExpOptions
;; @description PCRE options for the lazy programmer

;; @notes
;; options used by: directory, ends-with, find, find-all, member, parse, regex,
;; regex-comp, replace, search, starts-with

(context 'RegExpOptions)

(constant 'context-prefix "REO")

(setq codes '(
	(1 "PCRE_CASELESS") ; treat uppercase like lowercase
	(2 "PCRE_MULTILINE") ; limit search at a newline like Perl's /m
	(4 "PCRE_DOTALL") ; . (dot) also matches newline
	(8 "PCRE_EXTENDED") ; ignore whitespace except inside char class
	(16 "PCRE_ANCHORED") ; anchor at the start
	(32 "PCRE_DOLLAR_ENDONLY") ; $ matches at end of string, not before newline
	(64 "PCRE_EXTRA") ; additional functionality currently not used
	(128 "PCRE_NOTBOL") ; first ch, not start of line; ^ shouldn't match
	(256 "PCRE_NOTEOL") ; last char, not end of line; $ shouldn't match
	(512 "PCRE_UNGREEDY") ; invert greediness of quantifiers
	(1024 "PCRE_NOTEMPTY") ; empty string considered invalid
	(2048 "PCRE_UTF8") ; pattern and strings as UTF-8 characters
	(0x8000 "REPLACE_ONCE") ; replace only one occurrence only for use in replace
	(0x10000 "PRECOMPILED") ; pattern is pre-compiled, can only be combined with RREPLACE_ONCE 0x8000
	))

(context MAIN)
