;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex5) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
(define base 15)

(overlay/xy
(overlay/xy (rectangle (* 3 base) base "solid" "gray")
            (- (* base 1.5)) base
            (rectangle (* base 6) base "solid" "gray"))
            base (* base 1.5)
(overlay/xy (circle (/ base 2) "solid" "black")
            (* base 3) 0
            (circle (/ base 2) "solid" "black")))

(overlay/xy
(overlay/xy (triangle/saa (* 2 base) 90 45 "solid" "gray")
            (* 2 base) 0
            (rectangle (* 4 base) (* 2 base) "solid" "gray"))
            (* 6 base) 0
            (triangle/saa (* 3 base) 45 45 "solid" "gray"))

(overlay/xy
          (regular-polygon (* 3 base) 3 "solid" "green")
          base (* base 2.5)
          (rectangle base (* base 1.5) "solid" "brown"))