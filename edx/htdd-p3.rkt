;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname htdd-p3) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; =================
;; Data definitions:

;; RocketDescent is one of:
;;  - Number(0, 100]
;;  - false
;; interp. the number of kilometers remaining to touchdown, false if the rocket's descent has ended
(define RD1 100)  ; start
(define RD2 50)   ; middle
(define RD3 0.5)  ; near end
(define RD4 false); end

#;
(define (fn-for-rocket-descent rd)
  (cond [(and (number? rd)
              (< 0 rd)
              (<= rd 100))
         (... rd)]
        [else (...)]))

;; Template rules used:
;;  - one of: 2 cases
;;  - atomic non-distinct: Integer[100, 0)
;;  - atomic distinct: false


;; ==================
;; Functions:

; RocketDescent -> String
; outputs a string based on the value of RocketDescent

(check-expect (rocket-descent-to-msg RD1) "100 kilometers until touchdown!")
(check-expect (rocket-descent-to-msg RD2) "50 kilometers until touchdown!")
(check-expect (rocket-descent-to-msg RD3) "1/2 kilometers until touchdown!")
(check-expect (rocket-descent-to-msg RD4) "The rocket has landed!")

;(define (rocket-descent-to-msg rd) "")  ; stub

; <copied template from RocketDescent>

(define (rocket-descent-to-msg rd)
  (cond [(and (number? rd)
              (< 0 rd)
              (<= rd 100))
         (string-append (number->string rd) " kilometers until touchdown!")]
        [else "The rocket has landed!"]))