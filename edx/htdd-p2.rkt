;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname htdd-p2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; BuildingStatus is one of:
;;  - "new"
;;  - "old"
;;  - "heritage"
;; interp. the age of a building in downtown Vancouver

;; <examples are redundant for enumerations>

#;
(define (fn-for-building-status bs)
  (cond [(string=? "new" bs) (...)]
        [(string=? "old" bs) (...)]
        [(string=? "heritage" bs) (...)]))
;; Template rules used:
;;  - one of: 3 cases
;;  - atomic distinct: "new"
;;  - atomic distinct: "old"
;;  - atomic distinct: "heritage"

;; ==================
;; Functions:

;; BuildingStatus -> Boolean
;; produces 'true' if the BuildingStatus is "old" and should be demolished

(check-expect (demolish? "new") false)
(check-expect (demolish? "old") true)
(check-expect (demolish? "heritage") false)

;(define (demolish? bs) false)  ; stub

; <template from BuildingStatus>

(define (demolish? bs)
  (string=? bs "old"))