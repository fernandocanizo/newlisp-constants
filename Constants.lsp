#!/usr/bin/env newlisp
;; Creation Date: Thu, 16 May 2013 09:02:18 -0300
;; @author Fernando Canizo (aka conan) - http://conan.muriandre.com/
;; @module Constants
;; @description newLISP constants for the lazy programmer
;; @version 2013.05.18

(context 'Constants)

(constant 'USE_MODULES 0)
(constant 'USE_PREFIXES 1) ; TODO check for prefix collision before starting building


; TODO should be better to pass a list of files instead? But how do I find context name? By convention?
(define (Constants:Constants lst-modules-to-load (int-mode USE_MODULES))
	; check parameters
	(if (not (list? lst-modules-to-load))
		(throw-error "A list of modules is required"))
	(if (or (= USE_MODULES int-mode) (= USE_PREFIXES int-mode))
		; set it visible for other functions
		(setq mode int-mode)
		; else
		(throw-error "Mode must be set to either USE_MODULES or USE_PREFIXES"))

	(dolist (a-context lst-modules-to-load)
		; TODO how to avoid modules being prepended with MAIN without making them strings? Again: maybe passing files instead?
		(let (module-file-name (string (replace "MAIN:" (string a-context) "") ".lsp"))
			(when (file? module-file-name)
				(load module-file-name)
				(create-constant-symbols a-context)))))


;; create constant symbols for each code defined inside the proper context
(define (create-constant-symbols a-context)
	(when (context? (eval a-context))
		; TODO is there a more straightforward method to refer to a-context:codes?
		(let (str-codes-ref (string a-context ":" "codes"))
			(when (list? (eval-string str-codes-ref))
				(let (codes-copy (copy (eval-string str-codes-ref)))
					(while codes-copy
						(let (error-code (pop codes-copy))
							(make-constant a-context (make-constant-name (last error-code)) (first error-code)))))))))


(define (make-constant a-context str-name int-value)
	(if (not (integer? int-value))
		(throw-error "int-value should be an integer"))

	(if (= USE_MODULES Constants:mode)
		(begin
			(if (not (legal? str-name))
				(throw-error (string "str-name should be a legal name for making a symbol. Offending string:\n" str-name)))

			(context a-context)
			(constant (sym str-name) int-value))
			; no need to switch back context after constant creation, it automatically goes to Constants

		; else USE_PREFIXES
		(begin
			(let (constant-name (string (eval-string (string a-context ":" "prefix")) "_" str-name))
				(if (not (legal? constant-name))
					(throw-error (string "constant-name should be a legal name for making a symbol. Offending string:\n" constant-name)))

				(constant (sym constant-name) int-value)))))


(define (make-constant-name str-data)
	; remove all unwanted characters
	(replace "," str-data "")
	(replace ":" str-data "")
	(replace ";" str-data "")
	(replace "'" str-data "")
	(replace "(" str-data "")
	(replace ")" str-data "")
	(replace { -$} str-data "" 0)
	; finally add underscores and uppercase everything
	(upper-case (replace " " str-data "_")))


(context MAIN)
