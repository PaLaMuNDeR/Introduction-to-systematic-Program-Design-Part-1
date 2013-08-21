;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname |Practice for final test|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "htdp")))))
(require 2htdp/image)

(define-struct box (w h l))
;; Box is (make-box Integer Integer Integer)
;; interp. A parcel to be shipped, with width, height and length in centimeters.
(define B1 (make-box 10 20 30))
#;
(define (fn-for-box b)
  ???)

(check-expect (volume (make-box  2 3 5)) 30)
(define (volume b)
  (* (box-w b) (box-h b) (box-l b)))
(volume (make-box 2 3 5))

;; =======
;; Questions 6-10

;; Thing is String

(define-struct frotz (a b))
;; Frotz is (make-frotz Frum Thing)

(define-struct frum (a b))
;; Frum is (make-frum Frotz Thing)

;; ========
;; Questions 11-14

(define-struct person (name ec kids))
;; Person is (make-person String String (listof Person))
;; interp. A descendant family tree, each person has:
;;           a name of the form "Harry"
;;           an eye color of the form "green"
;;           kids is a list of the children
;;  NOTE: we are not writing the (listof Person) type out in its detailed
;;        ListOfPerson is one of... form, but there are two types here: Person and
;;        (listof Person). They are involved in a mutual reference relationship and
;;        this is reflected in the templates below.
(define DFT1 (make-person "Lily" "brown" empty))
(define DFT2 (make-person "Harry"
                          "green"
                          (list (make-person "James" "brown" empty)
                                (make-person "Albus" "green" empty)
                                DFT1)))
(define DFT3 (make-person "Lily"
                          "green"
                          (list DFT2)))
#;
(define (fn-for-dft p)
  (local [(define (fn-for-person p)
            (... (person-name p)
                 (person-ec p)
                 (fn-for-lop (person-kids p))))
          (define (fn-for-lop lop)
            (cond [(empty? lop) (...)]
                  [else
                   (... (fn-for-person (first lop))
                        (fn-for-lop (rest lop)))]))]
    (fn-for-person p)))



;;
;; String Person -> String
;; produce name of everyone in tree with given eye color
(check-expect (matching-ec "blue" DFT1) empty)
(check-expect (matching-ec "orange" DFT3) empty)
(check-expect (matching-ec "green" DFT3) (list "Lily" "Harry" "Albus"))

(define (matching-ec ec p)
  (local [(define (fn-for-person p)
            (if (string=? (person-ec p) ec)
                (cons (person-name p)                 
                      (fn-for-lop (person-kids p)))
                (fn-for-lop (person-kids p))))
          (define (fn-for-lop lop)
            (cond [(empty? lop) empty]
                  [else
                   (append (fn-for-person (first lop))
                           (fn-for-lop (rest lop)))]))]
    (fn-for-person p)))

(matching-ec "green" DFT3)


;; DFT -> Natural
;; count the number of people in DFT that have children
(check-expect (count-have-children DFT1) 0)
(check-expect (count-have-children DFT2) 1)
(check-expect (count-have-children DFT3) 2)

(define (count-have-children p)
  (local [(define (fn-for-person p)
            (if (empty? (person-kids p))
    (fn-for-lop (person-kids p))
    (add1 (fn-for-lop (person-kids p)))))
          (define (fn-for-lop lop)
            (cond [(empty? lop) 0]
                  [else
                   (+ (fn-for-person (first lop))
                        (fn-for-lop (rest lop)))]))]
    (fn-for-person p)))


(define s1 (square 20 "solid" "red"))


