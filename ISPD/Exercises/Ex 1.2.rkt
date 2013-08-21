;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Ex 2|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(require 2htdp/image)
;(circle 30 "solid" "red")
;        ;r  
;(rectangle 30 60 "outline" "blue")
;(text "hello" 24 "orange")
;              ;font size 
;(overlay (circle 10 "solid" "red")
; ;above/beside/overlay
;       (circle 20 "solid" "yellow")
;       (circle 30 "solid" "green"))
;(define CAT "cat")
;(text CAT 24  "black")

(define (bulb c);function
  (circle 20 "solid" c))

(above (bulb "red") 
       (bulb "yellow")
       (bulb "green"))

;all the rules at the web-page - Language(s)

(bulb (string-append "re" "d"))
;(define (<name> <name> .. ) <expression>)
