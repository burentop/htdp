;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 1b-quiz) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)

;; Image Image -> Boolean
;; consumes two images and produces 'true' if the first is larger (both width & height) than the second

(check-expect (first-larger?
               (rectangle 5 5 "solid" "red")
               (rectangle 10 10 "solid" "blue"))
              #false)
(check-expect (first-larger?
               (rectangle 10 20 "solid" "red")
               (rectangle 20 20 "solid" "blue"))
              #false)
(check-expect (first-larger?
               (rectangle 10 20 "solid" "red")
               (rectangle 15 15 "solid" "blue"))
              #false)
(check-expect (first-larger?
               (rectangle 10 5 "solid" "red")
               (rectangle 10 10 "solid" "blue"))
              #false)
(check-expect (first-larger?
               (rectangle 20 20 "solid" "red")
               (rectangle 20 20 "solid" "blue"))
              #false)
(check-expect (first-larger?
               (rectangle 15 20 "solid" "red")
               (rectangle 15 15 "solid" "blue"))
              #false)
(check-expect (first-larger?
               (rectangle 20 5 "solid" "red")
               (rectangle 10 10 "solid" "blue"))
              #false)
(check-expect (first-larger?
               (rectangle 25 20 "solid" "red")
               (rectangle 20 20 "solid" "blue"))
              #false)
(check-expect (first-larger?
               (rectangle 20 20 "solid" "red")
               (rectangle 15 15 "solid" "blue"))
              #true)

;(define (first-larger? img1 img2) false)  ; stub

;(define (first-larger? img1 img2)         ; template
;  (... img1 img2))

(define (first-larger? img1 img2)
  (and (> (image-width img1) (image-width img2))
       (> (image-height img1) (image-height img2))))