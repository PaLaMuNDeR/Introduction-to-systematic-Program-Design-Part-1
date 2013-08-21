;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |Final Project 2|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(require racket/list)
;; =================
;; Data definitions:

;; Square is Boolean

;; Board is (list of Square) 16 elemnts long
;; interp.
;; Board 4x4 where each square has row and column (r,c)
;; We represent it as single flat list, in which rows are 
;; layed out one after another in a linear fashion. 

;; Pos is Natural [0, 15]
;; interp. 
;; the position of a square on the board for a given p
;;   - the row      is (quotient p 4)
;;   - the column   is (remainder p 4)
   
;;Convert 0-bassed row and column to Pos
(define (r-c->pos r c) (+ (* r 4) c)) ;for writing tests

;; ========================
;; Constants:
(define ALL-VALS (list true false ))
(define B false) ;stands for blank
(define Q true) ; stands for Queen
(define H true) ;stands for hit 
                ;(if the queen steps on the field it is H)


(define BD1
  (list B B B B
        B B B B
        B B B B
        B B B B ))

(define BD2     ;one Queen (unsolvable)
  (list Q H H H
        H H B B
        H B H B
        H B B H)) 
(define BD3      ;problem
  (list H Q H H
        H H H B
        B H B H
        B H B B))
(define BD4      ;solution
  (list H Q H H
        H H H Q
        Q H H H
        H H Q H))

;;Position of all the rows, columns
(define ROWS
  (list (list  0  1  2  3)
        (list  4  5  6  7)
        (list  8  9 10 11)
        (list 12 13 14 15)))

(define COLS
  (list (list 0  4   8  12)
        (list 1  5   9  13)
        (list 2  6  10  14)
        (list 3  7  11  15)))


;; ===========
;; Functions:



;;Board Pos Val -> Board
;; produce new board with val at given position
(check-expect (fill-square BD1 (r-c->pos 0 0) H)
              (cons H (rest BD1)))

(define (fill-square bd p nv)
  (append (take bd p)
          (list nv)
          (drop bd (add1 p))))

;;Board Pos -> Board
;;produce new board with Queen at given position
#;
(check-expect (add-queen BD1 (r-c->pos 0 0))
             ( (fill-square BD1 (r-c->pos 0 0) Q)
              (fill-square BD1 (r-c->pos 0 1) H)
              (fill-square BD1 (r-c->pos 0 2) H)
              (fill-square BD1 (r-c->pos 0 3) H)
              (fill-square BD1 (r-c->pos 1 0) H)
              (fill-square BD1 (r-c->pos 2 0) H)
              (fill-square BD1 (r-c->pos 3 0) H)
              (fill-square BD1 (r-c->pos 1 1) H)
              (fill-square BD1 (r-c->pos 2 2) H)
              (fill-square BD1 (r-c->pos 3 3) H)))
(check-expect (add-queen BD1 (r-c->pos 0 0))
              BD2)
(define (add-queen bd p)
  (append (take bd p)
          (list Q)
          (drop bd (if 
                     (< p 4) (or true (r-c->pos 0 0) (r-c->pos 0 1) (r-c->pos 0 2) (r-c->pos 0 3))
                     (if (and (< p 8) (> p 3))  (or true (r-c->pos 1 0) (r-c->pos 1 1) (r-c->pos 1 2) (r-c->pos 1 3))
                      (if (and (< p 12) (> p 7))  (or true (r-c->pos 2 0) (r-c->pos 2 1) (r-c->pos 2 2) (r-c->pos 2 3))
                         (add1 (or true (r-c->pos 3 0) (r-c->pos 3 1) (r-c->pos 3 2) (r-c->pos 3 3)))))))))
  