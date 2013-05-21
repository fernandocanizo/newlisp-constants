#!/usr/bin/env newlisp
;; Creation Date: Tue, 21 May 2013 15:29:07 -0300
;; @author Fernando Canizo (aka conan) - http://conan.muriandre.com/
;; @module Multiprocessing
;; @description Linux signals and options for the lazy programmer

;; @notes
;; options used by destroy, signal, process (on Windows) and wait-pid
;; "destroy" and "signal" use options taken from 'kill -l'
;; "process" use only win32 options
;; couldn't find appropriate values for "wait-pid"

(context 'Multiprocessing)

(constant 'context-prefix "LS")

(setq codes '(
	; kill -l options, used by "destroy" and "signal"
	(1 "SIGHUP")
	(2 "SIGINT")
	(3 "SIGQUIT")
	(4 "SIGILL")
	(5 "SIGTRAP")
	(6 "SIGABRT")
	(7 "SIGBUS")
	(8 "SIGFPE")
	(9 "SIGKILL")
	(10 "SIGUSR1")
	(11 "SIGSEGV")
	(12 "SIGUSR2")
	(13 "SIGPIPE")
	(14 "SIGALRM")
	(15 "SIGTERM")
	(16 "SIGSTKFLT")
	(17 "SIGCHLD")
	(18 "SIGCONT")
	(19 "SIGSTOP")
	(20 "SIGTSTP")
	(21 "SIGTTIN")
	(22 "SIGTTOU")
	(23 "SIGURG")
	(24 "SIGXCPU")
	(25 "SIGXFSZ")
	(26 "SIGVTALRM")
	(27 "SIGPROF")
	(28 "SIGWINCH")
	(29 "SIGIO")
	(30 "SIGPWR")
	(31 "SIGSYS")
	(34 "SIGRTMIN")
	(35 "SIGRTMIN+1")
	(36 "SIGRTMIN+2")
	(37 "SIGRTMIN+3")
	(38 "SIGRTMIN+4")
	(39 "SIGRTMIN+5")
	(40 "SIGRTMIN+6")
	(41 "SIGRTMIN+7")
	(42 "SIGRTMIN+8")
	(43 "SIGRTMIN+9")
	(44 "SIGRTMIN+10")
	(45 "SIGRTMIN+11")
	(46 "SIGRTMIN+12")
	(47 "SIGRTMIN+13")
	(48 "SIGRTMIN+14")
	(49 "SIGRTMIN+15")
	(50 "SIGRTMAX-14")
	(51 "SIGRTMAX-13")
	(52 "SIGRTMAX-12")
	(53 "SIGRTMAX-11")
	(54 "SIGRTMAX-10")
	(55 "SIGRTMAX-9")
	(56 "SIGRTMAX-8")
	(57 "SIGRTMAX-7")
	(58 "SIGRTMAX-6")
	(59 "SIGRTMAX-5")
	(60 "SIGRTMAX-4")
	(61 "SIGRTMAX-3")
	(62 "SIGRTMAX-2")
	(63 "SIGRTMAX-1")
	(64 "SIGRTMAX")
	; options for "process" on Win32
	(0 "START_HIDDEN")
	(1 "START_NORMAL")
	(2 "START_MINIMIZED")
	))

(context MAIN)
