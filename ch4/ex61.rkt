;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex61) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/universe)
(require 2htdp/image)

(define RED 0)
(define GREEN 1)
(define YELLOW 2)

(define (make-light color)
  (place-image
   (circle 20 "solid" color)
   100 100
   (empty-scene 200 200)))

; An S-TrafficLight is one of:
; - RED
; - GREEN
; - YELLOW

; N-TrafficLight -> N-TrafficLight
; yields the next state, given current state cs
(check-expect (tl-next-symbolic RED) GREEN)
(check-expect (tl-next-symbolic YELLOW) RED)
(define (tl-next-symbolic cs)
  (cond
    [(equal? cs RED) GREEN]
    [(equal? cs GREEN) YELLOW]
    [(equal? cs YELLOW) RED]))

; TrafficLight -> Image
; renders the current state cs as an image
(check-expect (tl-render 0) (make-light "red"))
(check-expect (tl-render 2) (make-light "yellow"))
(define (tl-render current-state)
  (make-light
   (cond
     [(= current-state 0) "red"]
     [(= current-state 1) "green"]
     [(= current-state 2) "yellow"])))

; TrafficLight -> TrafficLight
; simulates a clock-based American traffic light
(define (traffic-light-simulation initial-state)
  (big-bang initial-state
    [to-draw tl-render]
    [on-tick tl-next-symbolic 1]))