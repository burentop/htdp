;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex47) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
(require 2htdp/universe)

(define WIDTH-OF-WORLD 500)
(define HEIGHT-OF-WORLD 300)

(define BACKGROUND (rectangle WIDTH-OF-WORLD HEIGHT-OF-WORLD "solid" "white"))

(define BAR-HEIGHT (/ HEIGHT-OF-WORLD 2))

(define Y-BAR (/ HEIGHT-OF-WORLD 2))
(define X-BAR (/ WIDTH-OF-WORLD 2))

; A WorldState is a Number.
; interpretation the width of the Happy Bar in pixels

; WorldState String -> WorldState
; increases the WorldState by 1/5 if down arrow pressed
; or by 1/3 if up arrow pressed

(check-expect (increase 200 "up") (+ 200 (/ 200 3)))
(check-expect (increase 200 "down") (+ 200 (/ 200 5)))

;(define (increase ws a-key) 500)  ; stub

(define (increase ws a-key)
  (cond
    [(key=? a-key "up") (+ ws (/ ws 3))]
    [(key=? a-key "down") (+ ws (/ ws 5))]
    [else ws]))

; WorldState -> Image
; places the happy bar into the BACKGROUND scene,
; according to the given world state
(check-expect (render 100) (place-image (rectangle 100 BAR-HEIGHT "solid" "red") X-BAR Y-BAR BACKGROUND))

(define (render ws)
  (place-image (rectangle ws BAR-HEIGHT "solid" "red") X-BAR Y-BAR BACKGROUND))

; WorldState -> WorldState
; decreases ws (happiness) by 0.1 for every clock tick
(check-expect (tock 20) 19.9)
(check-expect (tock 78) 77.9)

(define (tock ws)
  (- ws 0.1))

; WorldState -> WorldState
; launches the program from some initial state
(define (main ws)
  (big-bang ws
            [on-tick tock]
            [on-key increase]
            [to-draw render]))
