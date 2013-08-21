;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Practice 2.1|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;; Signature: String -> String
;; Purpose: Add "!" to String
;; Stub: (define (add1 "n") "0");
;; Examples and test: 
(check-expect (addin "Anev") "Anev!")
;(define (add1 "n") "0") ;this is the stub
(define (addin string)
  (string-append string "!"))
(addin "Anevche"
)