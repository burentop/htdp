;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname car-example) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/universe)
(require 2htdp/image)

(define WIDTH-OF-WORLD 200)
(define BACKGROUND
  (rectangle WIDTH-OF-WORLD (/ WIDTH-OF-WORLD 2) "solid" "white"))
(define Y-CAR (/ (image-height BACKGROUND) 2))

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

; A WorldState is a Number.
; interpretation the number of pixels between
; the left border of the scene and the car

; WorldState -> Image
; places the car into the BACKGROUND scene,
; according to the given world state
(define (render ws)
  (place-image CAR ws Y-CAR BACKGROUND))

; WorldState -> WorldState
; moves the car by 3 pixels for every clock tick
(check-expect (tock 20) 23)
(check-expect (tock 78) 81)

(define (tock ws)
  (+ ws 3))

; WorldState -> WorldState
; launches the program from some initial state
(define (main ws)
  (big-bang ws
            [on-tick tock]
            [to-draw render]
            [stop-when (> ws WIDTH-OF-WORLD)]))
