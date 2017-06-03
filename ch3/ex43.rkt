;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex43) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/universe)
(require 2htdp/image)

(define WIDTH-OF-WORLD 200)
(define TREE
  (underlay/xy (circle 10 "solid" "green")
               9 15
               (rectangle 2 20 "solid" "brown")))
(define BACKGROUND
  (overlay TREE (rectangle WIDTH-OF-WORLD (/ WIDTH-OF-WORLD 2) "solid" "white")))

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

; An AnimationState is a Number.
; interpretation the number of clock ticks
; since the animation started

; AnimationState -> Number
; calculates Y position based on AnimationState
(define (y-pos as)
  (+ Y-CAR (* 15 (sin as))))

; AnimationState -> Image
; places the car into the BACKGROUND scene,
; according to the given animation state
(define (render as)
  (place-image CAR (- as (/ (image-width CAR) 2)) (y-pos as) BACKGROUND))

; AnimationState -> AnimationState
; advances x by 1 pixel for every clock tick
(check-expect (tock 20) 21)
(check-expect (tock 78) 79)

(define (tock as)
  (+ as 1))

; AnimationState -> Boolean
; returns true if AnimationState is greater than the BACKGROUND

(check-expect (last-world? (tock 50)) #false)
(check-expect (last-world? (tock 300)) #true)

(define (last-world? as)
  (> as (+ (image-width CAR) (image-width BACKGROUND))))

; AnimationState -> AnimationState
; launches the program from some initial state
(define (main as)
  (big-bang as
            [on-tick tock]
            [to-draw render]
            [stop-when last-world?]))
