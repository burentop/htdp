;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex39) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)

(define WHEEL-RADIUS 5)
(define WHEEL-DISTANCE (* WHEEL-RADIUS 3))

(define WHEEL
  (circle WHEEL-RADIUS "solid" "black"))

(define SPACE
  (rectangle WHEEL-DISTANCE WHEEL-RADIUS "solid" "white"))
(define BOTH-WHEELS
  (beside WHEEL SPACE WHEEL))
(define CAR-TOP
  (rectangle (* 3 WHEEL-RADIUS) WHEEL-RADIUS "solid" "red"))
(define CAR-BOTTOM
  (rectangle (* 3 (image-width CAR-TOP)) (* 2 WHEEL-RADIUS) "solid" "red"))
(define CAR-TOP-SPACE
  (rectangle (/ (- (image-width CAR-BOTTOM) (image-width CAR-TOP)) 2) (image-height CAR-TOP) "solid" "white"))
(define TOTAL-CAR-TOP
  (beside CAR-TOP-SPACE CAR-TOP CAR-TOP-SPACE))
(define CAR
  (above TOTAL-CAR-TOP CAR-BOTTOM BOTH-WHEELS))
