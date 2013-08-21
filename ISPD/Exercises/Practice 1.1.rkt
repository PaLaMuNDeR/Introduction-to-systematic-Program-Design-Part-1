;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Practice 1|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(require 2htdp/image)

(define (sq c);function
  (square 30 "solid" c))

(above (beside (sq "blue")
               (sq "yellow"))
       (beside (sq "yellow")
               (sq "blue"))
       )
     
(+ (* 2 3) (/ 8 2))
(+ 6 (/ 8 2))
(+ 6 4)
10

(* (string-length "foo") 2)
(* 3 2)
6
(string-append "Super" " " "Glue")

(define IMAGE1 (rectangle 10 15 "solid" "red"))
(define IMAGE2 (rectangle 15 10 "solid" "red"))
"IMAGE 1" IMAGE1
"IMAGE 2" IMAGE2

"Is IMAGE1 taller than IMAGE 2"

(> (image-height IMAGE1)
   (image-height IMAGE2))
"Narrow"
(> (image-width IMAGE1)
   (image-width IMAGE2))
"Is it different"
(not ( = (image-height IMAGE1) (image-height IMAGE2)
))