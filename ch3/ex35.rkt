;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex35) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; String -> String
; extracts the last character s from a string str
; given:
;    "hello" for str
; expected:
;    (substring "hello"
;         (- (string-length "hello") 1)
;         (string-length "hello"))
(define (string-last str)
  (substring str
             (- (string-length str) 1)
             (string-length str)))

(string-last "hello")