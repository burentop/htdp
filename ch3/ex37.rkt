;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex37) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; String -> String
; given a string str, returns the same string without the first character
; given:
;    "hello" as str
; expected:
;    (substring "hello" 1 (string-length str))
(define (string-rest str)
  (substring str 1 (string-length str)))

(string-rest "hello")