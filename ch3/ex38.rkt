;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex38) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; String -> String
; given a string str, returns the same string without the last character
; given:
;    "hello" as str
; expected:
;    (substring "hello" 0 (- (string-length "hello") 1))
(define (string-remove-last str)
  (substring str 0 (- (string-length str) 1)))

(string-remove-last "hello")