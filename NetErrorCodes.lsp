#!/usr/bin/env newlisp
;; Creation Date: Sat, 18 May 2013 09:23:51 -0300
;; @author Fernando Canizo (aka conan) - http://conan.muriandre.com/
;; @module NetErrorCodes
;; @description Network error codes for the lazy programmer


(context 'NetErrorCodes)

(constant 'context-prefix "NET")

(setq codes '(
	(1 "Cannot open socket")
	(2 "DNS resolution failed")
	(3 "Not a valid service")
	(4 "Connection failed")
	(5 "Accept failed")
	(6 "Connection closed")
	(7 "Connection broken")
	(8 "Socket send() failed")
	(9 "Socket recv() failed")
	(10 "Cannot bind socket")
	(11 "Too many sockets in net-select")
	(12 "Listen failed")
	(13 "Badly formed IP")
	(14 "Select failed")
	(15 "Peek failed")
	(16 "Not a valid socket")
	(17 "Cannot unblock socket")
	(18 "Operation timed out")
	(19 "HTTP bad formed URL")
	(20 "HTTP file operation failed")
	(21 "HTTP transfer failed")
	(22 "HTTP invalid response from server")
	(23 "HTTP no response from server")
	(24 "HTTP document empty")
	(25 "HTTP error in header")
	(26 "HTTP error in chunked format")
	))

(context MAIN)
