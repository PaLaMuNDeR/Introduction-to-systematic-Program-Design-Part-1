;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |Final Project 2 (II chast) - Not finished|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;; Board -> Board or false
;; produce a solution for bd; or false if bd is unsolvable
;; Assume: bd is valid

(check-expect (solve BD3) BD4)
(check-expect (solve BD2) false)

#;
(define (solve bd) (false)) ;stub
  
(define (solve bd)
  (local [(define (solve--bd bd)
            (if (solved? bd)
                bd
                (solve--lobd (next-boards bd))))
          (define (solve--lobd lobd)
            (cond [(empty? lobd) false]
                  [else 
                   (local [(define try (solve--bd (first lobd)))]
                     (if (not (false? try))
                         try
                         (solve--lobd (rest lobd))))]))]
    (solve--bd bd)))
                         
;; Board -> Boolean
;; produce true if board is solved
;; Assume: board is valid, so it is solved if it is full
;; !!!
;  (define (solved? bd) false) ; stub

(define (solved? bd)
(andmap true? bd))

;; Board -> (listof Board)
;; produce list of valid next boards from board
;; finds first empty square, fills it with Q, keeps only valid boards
;; !!!
;  (define (next-boards bd) empty) ;stub

(check-expect (next-boards (cons Q (rest BD1)))
              BD2)
(deine (next-boards bd)
       (keep-only-valid (fill-with-Q (find-blank bd) bd)))

;; Board -> Pos
;;produces position of the first blank square
;; ASSUME: the board has at least one blank square
(check-expect (find-blank BD1) 0)
(check-expect (find-blank (cons H (rest BD1))) 1)

(define (find-blank bd)
  (cond [(empty? bd) (error "The board didn't have any blank space.")
                     [else 
                      (if (false? (first bd))
                          0
                          (+ 1 (find-blank (rest bd))))]]))


;; Pos Board -> (listof Board)
;; Produce 4 boards, with blank filled with Q
(check-expect (fill-with-Q 0 BD1) BD2)
(define (fill-with-Q p bd)
  (local [(define (build-one n)
            (fill-square bd p (+ n 1)))]
    (build-list 4 build-one)))

;; Board Pos -> True or False
;; Produce Hit or Blank at giver position on board
(check-expect (read-square BD2 (r-c->pos 0 1)) H)
(check-expect (read-square BD2 (r-c->pos 0 0)) H)
(check-expect (read-square BD2 (r-c->pos 1 2)) B)

(define (read-square bd p)
  (list-ref bd p))