;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex58) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; A Price falls into one of three intervals:
; - 0 through 999
; - 1000 through 9999
; - 10000 and above.
; interpretation the price of an item

(define MID 1000)
(define HIGH 10000)
(define MID-TAX 0.05)
(define HIGH-TAX 0.08)

; Price -> Number
; computes the amount of tax charged for p
(check-expect (sales-tax 0) 0)
(check-expect (sales-tax 537) 0)
(check-expect (sales-tax 1000) (* MID-TAX 1000))
(check-expect (sales-tax 1282) (* MID-TAX 1282))
(check-expect (sales-tax 10000) (* HIGH-TAX 10000))
(check-expect (sales-tax 12017) (* HIGH-TAX 12017))
(define (sales-tax p)
  (cond
    [(and (<= 0 p) (< p MID)) 0]
    [(and (<= MID p) (< p HIGH)) (* MID-TAX p)]
    [(>= p HIGH) (* HIGH-TAX p)]))