;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname htdf-p2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; String -> Boolean
;; consume a string and produce 'true' if the length is < 5

(check-expect (short-string? "yes") #true)
(check-expect (short-string? "longest") #false)
(check-expect (short-string? "brent") #false)

;(define (short-string? s) false)  ; stub

;(define (short-string? s)        ; template
;  (... s))

(define (short-string? s)
  (< (string-length s) 5))