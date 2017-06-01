;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname htdf-p3) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)

;; Image -> Image
;; consumes an image and produces an outline around image

;(define (boxify img) (overlay (rectangle 2 2 "outline" "black") img))  ; stub

(define (boxify img) (overlay (rectangle (image-width img) (image-height img) "outline" "black") img))

(boxify (circle 20 "solid" "red"))