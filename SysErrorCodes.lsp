#!/usr/bin/env newlisp
;; Creation Date: Sat, 18 May 2013 07:43:25 -0300
;; @author Fernando Canizo (aka conan) - http://conan.muriandre.com/
;; @module SysErrorCodes
;; @description System error codes for the lazy programmer


(context 'SysErrorCodes)

(constant (sym "prefix") "SEC") ; to build constants from different contexts all under context "Constants"

;; System error codes are system dependant, so we cannot build a predefined list, must be built programmatically
;; and the building is made using the code "Unknown error" as a stopper. Anyway, check note at the end.
(setq codes '())


(let ((error-code 0) (end-not-found true) (unknown-error-repetitions 0))
	(while (true? end-not-found)
		(let (current-error (sys-error error-code))
			(push current-error codes -1)
			(if (starts-with (last current-error) "Unknown error")
				;; we cannot just stop at the first "Unknown error" found, there might be more codes
				(begin
					(inc unknown-error-repetitions)
					(if (> unknown-error-repetitions 1)
						(setq end-not-found nil)
						; else
						(inc error-code)))
			; else
			(begin
				; we found a different value, reset unknown-error-repetitions
				(setq unknown-error-repetitions 0)
				(inc error-code))))))

(context MAIN)

; Note: on Linux we got an "Unknown error" at 41 and another at 58 before
; reaching the end when they start to repeat. So it's kind of a fragile test to
; assume that when we reach "Unknown error" code we got all of them. However I
; didn't want to choose a brute force method yet. I preferred to set the end
; after finding several consecutives "Unknown error" codes
